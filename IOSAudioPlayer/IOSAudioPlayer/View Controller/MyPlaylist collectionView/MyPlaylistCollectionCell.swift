//
//  PlaylistCollectionCell.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/24/22.
//

import UIKit

class MyPlaylistCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CoverImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
//        playlistAlbumCoverImageView.translatesAutoresizingMaskIntoConstraints = true
//        playlistAlbumCoverNameLabel.translatesAutoresizingMaskIntoConstraints = true
    }
//    override var isSelected: Bool
 
    func configure(_ imageOfAlbum:UIImage,_ albumName:String){
        CoverImageView.image = imageOfAlbum
        NameLabel.text = albumName
    }
  
  
}

