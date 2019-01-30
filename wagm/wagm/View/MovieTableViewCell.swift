//
//  MovieTableViewCell.swift
//  What a great movie!
//
//  Created by wld on 30/01/2019.
//  Copyright © 2019 Vlad Burlaciuc. All rights reserved.
//

import UIKit


@objc protocol MovieTableViewCellDelegate {
    @objc func addToFavorite(forMovieCell:MovieTableViewCell)
    @objc func removeFromFavorite(forMovieCell:MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var movieCellDelegate: MovieTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addToFavorite(_ sender: UIButton) {
        
        if sender.isSelected{
            movieCellDelegate!.removeFromFavorite(forMovieCell: self)
        }else{
            movieCellDelegate!.addToFavorite(forMovieCell: self)
        }
        sender.isSelected = !sender.isSelected
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
