//
//  PopupView.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/31/22.
//

import UIKit
@IBDesignable
final class PopupView: UIView{
    //MARK: - set frame to initial view
    let popupView = UIView(frame: CGRect.zero)
       let popupTitle = UILabel(frame: CGRect.zero)
       let popupText = UITextField(frame: CGRect.zero)
       let popupButton = UIButton(frame: CGRect.zero)
       
       let BorderWidth: CGFloat = 2.0
       
    //MARK: - initialize view and its subview
    override init(frame: CGRect) {
           super.init(frame: frame)
           // Semi-transparent background
           backgroundColor = UIColor.black.withAlphaComponent(0.3)
           
           // Popup Background
           popupView.layer.borderWidth = BorderWidth
           popupView.layer.borderColor = UIColor.white.cgColor
           
           // Popup Title
           popupTitle.text = "Playlist's Name"
           popupTitle.textColor = UIColor.red
           popupTitle.backgroundColor = UIColor.white
           popupTitle.layer.masksToBounds = true
           popupTitle.adjustsFontSizeToFitWidth = true
           popupTitle.clipsToBounds = true
           popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupTitle.numberOfLines = 1
           popupTitle.textAlignment = .center
           
           // Popup Text
           popupText.textColor = UIColor.black
           popupText.font = UIFont.systemFont(ofSize: 25.0, weight: .semibold)
           popupText.text = "New Playlist"
           popupText.restorationIdentifier = popupText.text
           popupText.backgroundColor = UIColor.white
           popupText.textAlignment = .center
           
           
           // Popup Button
           popupButton.setTitle("Done", for: .normal)
           popupButton.setTitleColor(UIColor.white, for: .normal)
           popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupButton.backgroundColor = UIColor.red
           
           
           popupView.addSubview(popupTitle)
           popupView.addSubview(popupText)
           popupView.addSubview(popupButton)
           
           // Add the popupView(box) in the PopUpWindowView (semi-transparent background)
           addSubview(popupView)
           
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
   }

//MARK: - protocol delegate to update Name
protocol updateAlbumName{
    func setAlbumName(_ albumName:String)
    
}

