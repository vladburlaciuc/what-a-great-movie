//
//  BaseViewController.swift
//  What a great movie!
//
//  Created by wld on 30/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieTableViewCellDelegate {


    @IBOutlet weak var tableView: UITableView!
    var movieArray: [PlainMovie] = []
    var endPoint: String = ""
    let refreshControl = UIRefreshControl()
    var user = PlainUser(settingsData: UserDefaults.standard.value(forKey: "user") as! [String : Any])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Welcome \(user.name)"
        let rightButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
        self.navigationItem.rightBarButtonItem = rightButton
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCellIdentifier")
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableView.automaticDimension
     
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.reloadData()
    }
    
    func reloadData() {
        let  favoritesEndPoint = String(format: WebServiceEndpoint.getFavorites.fullURL(), user.id)
        
        ApiClient().GET(url: favoritesEndPoint) {[weak self] result in
            guard self != nil else { return }
            var favoritesArray : [PlainMovie] = []
            for movieItem in result{
                let movieModel = PlainMovie(settingsData: movieItem)
                favoritesArray.append(movieModel)
            }
            
            ApiClient().GET(url: self?.endPoint) {[weak self] result in
                guard self != nil else { return }
                self?.movieArray.removeAll()
                for movieItem in result{
                    let movieModel = PlainMovie(settingsData: movieItem)
                    self?.movieArray.append(movieModel)
                }
                
                for favorite in favoritesArray{
                    for movie in (self?.movieArray)!{
                        if favorite.id == movie.id{
                            movie.isFavorite = true
                        }
                    }
                }
                
                
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
        
        
    }
    
    
    
    @objc func logoutAction(){
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.synchronize()
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellIdentifier", for: indexPath) as! MovieTableViewCell
        cell.nameLabel.text = movieArray[indexPath.row].name
        cell.favoriteButton.tag = indexPath.row
        cell.movieCellDelegate = self
        cell.favoriteButton.isSelected = movieArray[indexPath.row].isFavorite
        
        ApiClient().downloadImage(url: movieArray[indexPath.row].thumbnail) {[weak self] image in
            guard self != nil else { return }
            DispatchQueue.main.async {
                if let cellToUpdate = self?.tableView.cellForRow(at: indexPath) as? MovieTableViewCell{
                    cellToUpdate.thumbnailImage.image = image
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    func addToFavorite(forMovieCell: MovieTableViewCell) {
        let movieData = movieArray[forMovieCell.favoriteButton.tag]
        UserService().setFavorites(userId: user.id, movieId: movieData.id) {result in
             self.movieArray[forMovieCell.favoriteButton.tag].isFavorite =  true
        }
    }
    
    func removeFromFavorite(forMovieCell: MovieTableViewCell) {
        let movieData = movieArray[forMovieCell.favoriteButton.tag]
        UserService().setUnfavorites(userId: user.id, movieId: movieData.id) {result in
            self.movieArray[forMovieCell.favoriteButton.tag].isFavorite =  false
            self.reloadData()
        }
    }
    
}
