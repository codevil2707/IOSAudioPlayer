//
//  PopUpViewController.swift
//  IOSAudioPlayer
//
//  Created by SimplyEntertaining on 2/23/22.
//

import UIKit

protocol PlaylistDelegate{
    func addPlaylistDelegate(_ playlistName:String,_ playlistImage:UIImage?)
}
protocol cancelDelegate{
    func cancelClicked()
}

class PopUpViewController: UIViewController, UITextFieldDelegate{
   
    @IBOutlet weak var cancelButton:UIButton!
    @IBOutlet weak var view3:UIView!
    @IBOutlet weak var createNewPlaylist: UILabel!
    @IBOutlet weak var playlistNameTextInput: UITextField!
    @IBOutlet weak var albumImageLabel: UILabel!
    @IBOutlet weak var albumImageCollectionView: UICollectionView!
    @IBOutlet weak var DoneButton: UIButton!
 
    let arrayOfImage = [UIImage(named: "Bollywood"),UIImage(named: "Pop"),UIImage(named: "Sufi"),UIImage(named: "Default"),UIImage(named: "Romantic"),UIImage(named: "Music"),UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8")]
    var playlistName = "NewPlaylist"
    var playlistImage = UIImage(named:"")
    var delegate:PlaylistDelegate?
    var cancelButtonDelegate:cancelDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        playlistNameTextInput.delegate = self
        albumImageCollectionView.delegate = self
        albumImageCollectionView.dataSource = self
        cellOfCollectionView()
        DoneButton.layer.cornerRadius = 10
        self.view.layer.cornerRadius = 10
        view3.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        albumImageCollectionView.allowsMultipleSelection = false
       
    }

    func cellOfCollectionView(){
        if (UIDevice.current.userInterfaceIdiom == .pad){
            let customCellWidth = (self.view.frame.size.width*0.9)/3
            let cellSize = CGSize(width: customCellWidth, height: customCellWidth)
            let spacingOfCell = customCellWidth*0.09
            let layout  = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            layout.sectionInset = UIEdgeInsets(top: spacingOfCell, left: spacingOfCell, bottom: spacingOfCell, right: spacingOfCell)
            layout.itemSize = cellSize
            albumImageCollectionView.setCollectionViewLayout(layout, animated: true)
        }
        else{
        let customCellWidth = (self.albumImageCollectionView.frame.size.height*0.6)/2
        let cellSize = CGSize(width: customCellWidth, height: customCellWidth)
        let spacingOfCell = customCellWidth*0.09
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       // layout.sectionInset = UIEdgeInsets(top: spacingOfCell, left: spacingOfCell, bottom: spacingOfCell, right: spacingOfCell)
        layout.itemSize = cellSize
            albumImageCollectionView.setCollectionViewLayout(layout, animated: true)
        }
       
        
    let nibCell = UINib(nibName: "ArrayOfImagesCollectionViewCell", bundle: nil)
    albumImageCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         playlistNameTextInput.resignFirstResponder()
        playlistName = playlistNameTextInput.text!
         return true;
       }
    


    @IBAction func doneButtonClicked(_ sender: UIButton) {
        remove()
        self.delegate?.addPlaylistDelegate(playlistName, playlistImage)
        
    }
    
    @IBAction func cancelButtonDidPressed(_ sender: UIButton) {
        remove()
        self.cancelButtonDelegate?.cancelClicked()
    }
    
    
}


extension PopUpViewController :  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        playlistImage = arrayOfImage[indexPath.row]

        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? ArrayOfImagesCollectionViewCell {
////        cell.isSelected = false
////        cell.overlayLayer.isHidden = true
//        }else{
//            print("CRASHED :", indexPath.item)
//        }
//        print("DE-Select item :", indexPath.item)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArrayOfImagesCollectionViewCell
        cell.collectionImage.image = arrayOfImage[indexPath.row]?.resizeImage(targetSize: cell.frame.size)
        return cell
    }
    
}

extension UIImage{
    func resizeImage(targetSize:CGSize)->UIImage?{

          var newSize: CGSize
        
        let widthRatio  = targetSize.width  / size.width
         let heightRatio = targetSize.height / size.height
         
         // Figure out what our orientation is, and use that to form the rectangle
       
         if(widthRatio > heightRatio) {
             newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
         } else {
             newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
         }
       
        // This is the rect that we've calculated out and this is what is actually used below
            let rect = CGRect(x:0, y:0, width: newSize.width, height: newSize.height)
            
            // Actually do the resizing to the rect using the ImageContext stuff
            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
            self.draw(in: rect)
           // image.draw()
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return newImage
           }
            return nil
    
}
}
