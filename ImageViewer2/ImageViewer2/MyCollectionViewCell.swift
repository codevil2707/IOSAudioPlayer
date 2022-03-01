//
//  MyCollectionViewCell.swift
//  ImageViewer
//
//  Created by SimplyEntertaining on 1/24/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
  
        @IBOutlet weak var overLayerView: UIView!
        @IBOutlet weak var imageNameLabel: UILabel!
        @IBOutlet weak var image: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
