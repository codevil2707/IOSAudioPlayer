//
//  LastCellOfTableViewCell.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/18/22.
//

import UIKit

class LastCellOfTableViewCell: UITableViewCell {

    @IBOutlet weak var dateOfCreationLabel:UILabel!
    @IBOutlet weak var totalNumberOfSongLabel:UILabel!
    @IBOutlet weak var totalDurationLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(selectedPlaylist:AlbumStruct){
        let totalDuration = totalDuration(selectedPlaylist.albumPlaylist!)
        let convertedTime = convertTime(totalDuration)
        
       if (selectedPlaylist.albumMode == .Default){
           dateOfCreationLabel.text = " \(String(describing: selectedPlaylist.albumName!)) 2022-02-01"
        }
        else{
        dateOfCreationLabel.text = "\(String(describing: selectedPlaylist.albumName!)) \(Date().string(format: "yyyy-MM-dd"))"
        }
        totalNumberOfSongLabel.text = "\(selectedPlaylist.albumPlaylist?.count ?? 0) SONGS, " + "\(convertedTime)"
       
        
       
    }
   
    func totalDuration(_ playlistDuration:[SongInfo]) -> Float{
        var totalDuration = 0.0
        for duration in playlistDuration{
            let temp = duration.songDuration
            totalDuration += Double(temp)
        }
        return Float(totalDuration)
    }
    
    
}
extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

func convertTime(_ time:Float)->String{
    let durationInSec = Int(time)
    var hour:Int = 00
    var  min:Int = 00
    var sec:Int = 00
    // if hour
    if(durationInSec>3600){
        hour = durationInSec/3600
        min = (durationInSec%3600)/60
        sec = (durationInSec%3600)%60
       
        return "\(hour) HR : \(min) MIN : \(sec) SEC"
    } // if has minutes
    else if(durationInSec>60){
        min = durationInSec/60
        sec = durationInSec%60
        return "\(min) MIN : \(sec) SEC"
    }
    else{
        sec = durationInSec
       
        return "\(min) min : \(sec) sec"
    }
    
}
