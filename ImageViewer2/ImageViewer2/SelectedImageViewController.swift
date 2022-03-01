//
//  SelectedImageViewController.swift
//  ImageViewer
//
//  Created by SimplyEntertaining on 1/1/21.
//

import UIKit

class SelectedImageViewController: NavigationViewController{
    var image:UIImage?
 
       override func viewDidLoad() {
        super.viewDidLoad()
       AddView()
       
    }
  
    
    func AddView(){
        var imgView = SelectedImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/1.5, height: view.frame.width/1.5))
       let newFrameSize = calculateNewWeidthAndHeight(imgView.frame.width, imgView.frame.height, image!.size.width, image!.size.height)
        imgView = .init(frame: CGRect(origin: .zero, size: newFrameSize))
        imgView.center = view.center
        imgView.viewImage.image = image
        imgView.backgroundColor = UIColor.clear
        view.addSubview(imgView)
        
       
       
    }
    
    @objc func touchHappen() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        print("hi")
    }
    func calculateNewWeidthAndHeight(_ avilableFrameWidth:CGFloat,_ avilableFrameHeight:CGFloat,_ avilableImageWidth:CGFloat,_ avilableImageHeight:CGFloat)->CGSize{
     //required height and breath of image
        var finalImageWidth:CGFloat = 0
        var finalImageHeight:CGFloat = 0
        //take width constant as avilable frame width
        let newImageWidth1 = avilableFrameWidth
        let newImageHeight1 = (avilableImageHeight/avilableImageWidth)*newImageWidth1
       
        //case2 take height will constant as frame height
        let newImageHeight2 = avilableFrameHeight
        let newImageWidth2 = (avilableImageWidth/avilableImageHeight)*newImageHeight2
        
        if (newImageWidth1<=avilableFrameWidth && newImageHeight1<=avilableFrameHeight){
            finalImageWidth = newImageWidth1
            finalImageHeight = newImageHeight1
           
        }
        else if(newImageWidth2<=avilableFrameWidth && newImageHeight2<=avilableFrameHeight){
             finalImageWidth = newImageWidth2
            finalImageHeight = newImageHeight2
            
        }
        
        return CGSize(width: finalImageWidth, height: finalImageHeight)
    }
    
    
    override func didClickednext(){
        navigationController?.popToRootViewController(animated: true)
    }
  
    override func didClickedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
