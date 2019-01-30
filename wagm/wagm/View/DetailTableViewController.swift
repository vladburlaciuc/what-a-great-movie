//
//  DetailTableViewController.swift
//  What a great movie!
//
//  Created by wld on 30/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
   
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var numberOfFavoriteLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    public var movieDetails: PlainMovie?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = " "
        self.title = movieDetails?.name
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableView.automaticDimension
        descriptionLabel.text = movieDetails?.description
        numberOfFavoriteLabel.text = "\(movieDetails?.numberOfFavorites ?? 0)"
        directorLabel.text = "by \(movieDetails?.director ?? "")"
        yearLabel.text = "\(movieDetails?.year ?? 0)"
        genreLabel.text = movieDetails?.gentres 
        ApiClient().downloadImage(url: movieDetails!.thumbnail) {[weak self] image in
            guard self != nil else { return }
            DispatchQueue.main.async {
                self?.thumbnail.image = image
            }
        }
    }
}


