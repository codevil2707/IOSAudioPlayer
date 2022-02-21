//
//  selectedPlaylistTVCTableViewCell.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/18/22.
//

import UIKit

class SelectedPlaylistTableViewCell: UITableViewCell {
    @IBOutlet weak var songImageView:UIImageView!
    @IBOutlet weak var songNameLabel:UILabel!
    @IBOutlet weak var artistNameLabel:UILabel!
    @IBOutlet weak var backgroundViewLayer: UIView!
    
    
//    var selectedIndex:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
            }

    
    func configureCell(_ selectedPlaylist:AlbumStruct,cellIndex:IndexPath){
        let newIndexPath = cellIndex.row-1
       
        songImageView.image = UIImage(named: selectedPlaylist.albumPlaylist![newIndexPath].songImage)
        songNameLabel.text = selectedPlaylist.albumPlaylist![newIndexPath].songName
        artistNameLabel.text = selectedPlaylist.albumPlaylist![newIndexPath].songArtist
    }
    
    
    
    
  
}
