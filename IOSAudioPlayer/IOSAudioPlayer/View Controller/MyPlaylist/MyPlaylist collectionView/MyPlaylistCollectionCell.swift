//
//  PlaylistCollectionCell.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/24/22.
//

import UIKit
protocol DeletePlaylistDelegate{
    func deletePlaylist(_ selectedindex:Int)
}

class MyPlaylistCollectionCell: UICollectionViewCell, UIAlertViewDelegate {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CoverImageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var playButton:UIButton!
    
    var indexPathOfPlaylist:Int?
    var delegate:DeletePlaylistDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
//        playButton.layer.cornerRadius = 100
//        playButton.layer.masksToBounds = true
//        playlistAlbumCoverImageView.translatesAutoresizingMaskIntoConstraints = true
//        playlistAlbumCoverNameLabel.translatesAutoresizingMaskIntoConstraints = true
    }
  
 
    func configure(_ playlists:AlbumStruct,_ indexPath:IndexPath){
        CoverImageView.image = playlists.albumImage?.resizeImage(targetSize: self.frame.size)
        NameLabel.text = playlists.albumName
        if playlists.albumMode == .User{
            deleteButton.isHidden = false
            indexPathOfPlaylist = indexPath.row
        }
        else {
            deleteButton.isHidden = true
        }
        
    }
  
    @IBAction func deleteButtonDidPressed(_ sender: UIButton) {
        if let selectedIndexPath = indexPathOfPlaylist{
            self.delegate?.deletePlaylist(selectedIndexPath)
            
        }
        
    }
    
  
}

