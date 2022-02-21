//
//  songListToAddPlaylistCell.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/25/22.
//

import Foundation
import UIKit

class SongListToAddPlaylistCell:UITableViewCell{
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//           super.init(style: style, reuseIdentifier: reuseIdentifier)
//           self.selectionStyle = .none
//       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           if selected{ checkmarkImageView.layer.opacity = 1
               songNameLabel.textColor = themeColor.highlightColor
               self.backgroundColor = themeColor.primary1Color
           }
           else{ checkmarkImageView.layer.opacity = 0
               songNameLabel.textColor = themeColor.textColor1
           }
           
          
         

       }
    
}
