//
//  ArrayOfImagesCollectionViewCell.swift
//  Go Music
//
//  Created by SimplyEntertaining on 2/2/22.
//

import UIKit

// highlighted - temporary decore untill touch
// selected  - permamnt decore
class ArrayOfImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionImage:UIImageView!
    @IBOutlet weak var overlayLayer:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    override var isSelected: Bool  {
        didSet {
            overlayLayer.isHidden = !isSelected
        }
    }
    
    
}
