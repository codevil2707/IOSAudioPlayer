//
//  FirstCellOfTableViewCell.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/20/22.
//

import UIKit

protocol playButtonDeelegate{
    func playButtonClicked(_ action:Bool)
}

class FirstCellOfTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playlistImageView:UIImageView!
    @IBOutlet weak var playlistNameLabel:UILabel!
    @IBOutlet weak var playlistModeLabel:UILabel!
    @IBOutlet weak var playlistPlayButton:UIButton!
    var delegate:playButtonDeelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        playlistImageView.layer.cornerRadius = 10
        playlistPlayButton.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ selectedAlbum:AlbumStruct){
        playlistImageView.image = selectedAlbum.albumImage
        playlistNameLabel.text = selectedAlbum.albumName
        playlistModeLabel.text = selectedAlbum.albumMode.rawValue
    }
    
    @IBAction func playButtonDidPressed(_ sender: UIButton) {
        
        self.delegate?.playButtonClicked(true)
    }
}
