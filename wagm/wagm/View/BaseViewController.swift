//
//  BaseViewController.swift
//  What a great movie!
//
//  Created by wld on 30/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var movieArray: [PlainMovie] = []
    var endPoint: String = ""
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Welcome vlad"
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
        print(endPoint)
        ApiClient().GET(url: endPoint) {[weak self] result in
            guard self != nil else { return }
            self?.movieArray.removeAll()
            for movieItem in result{
                let movieModel = PlainMovie(settingsData: movieItem)
                self?.movieArray.append(movieModel)
            }
            self?.tableView.reloadData()
             self?.refreshControl.endRefreshing()
        }
    }
    
    
    
    @objc func logoutAction(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellIdentifier", for: indexPath) as! MovieTableViewCell
        cell.nameLabel.text = movieArray[indexPath.row].name
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
    

}
