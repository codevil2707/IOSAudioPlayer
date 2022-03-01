//
//  selectedImage.swift
//  ImageViewer
//
//  Created by SimplyEntertaining on 2/4/22.
//

import Foundation
import UIKit

class SelectedImageView:UIView{
    var parentView = UIView(frame:CGRect.zero)
    var viewImage = UIImageView(frame:CGRect.zero)
    var isTapClicked:Bool = true
    var initialPoint : CGPoint = .zero
    var initialsize : CGSize = .zero
    var lastRotation: CGFloat = 0
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        
        viewImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width-20, height: self.frame.height-20))
        viewImage.center = self.center
        print("Initial center \(viewImage.center),\(self.center)")
        self.addSubview(viewImage)
        viewImage.image = UIImage()
        viewImage.backgroundColor = UIColor.blue
        viewImage.layer.borderColor = .init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
        viewImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
           tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tap)
        viewImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panClicked)));
        viewImage.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(self.didPinch)))
        viewImage.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(self.didRotate)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didRotate(sender: UIRotationGestureRecognizer){
        if isTapClicked == false{
       
        var originalRotation: CGFloat = 0
        if sender.state == .began {
            sender.rotation = lastRotation
                originalRotation = sender.rotation
           } else if sender.state == .changed {
               let newRotation = sender.rotation + originalRotation
         self.transform = CGAffineTransform(rotationAngle: newRotation)
               print (transform)
         }
               else if sender.state == .ended {
              lastRotation = sender.rotation
           }
        }
    }
    @objc func didPinch(gestureRecognizer:UIPinchGestureRecognizer){
        if isTapClicked == false {
           initialsize = self.bounds.size
            print (initialsize)
            if gestureRecognizer.state == .changed{
                let scale = gestureRecognizer.scale
//                if (self.bounds.width >= self.superview!.bounds.width*1.5 || self.bounds.height >= self.superview!.bounds.height*1.5) && scale > 1 {
//                    print("nothing")
//                }
//                else {
                   
                   
                    self.bounds.size.width = initialsize.width*scale
                    self.bounds.size.height = initialsize.height*scale
                    
                    viewImage.bounds.size.width *= scale
                    viewImage.bounds.size.height *= scale
                    print (viewImage.frame.size,self.bounds.size)
                    viewImage.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
                
                
                gestureRecognizer.scale = 1
//            }
        }
        }
    }
    
    @objc func panClicked(gestureRecognizer:UIPanGestureRecognizer){
        if isTapClicked == false {
        //let originalCenter = self.center // 100
       
        if gestureRecognizer.state == .began{
           //print(originalCenter)
             initialPoint = self.center
        }
        else if gestureRecognizer.state == .changed{
           
            let translation = gestureRecognizer.translation(in: self)
            self.center.x = initialPoint.x + translation.x
            self.center.y = initialPoint.y + translation.y
            print(self.center)
            if self.center.x <= 0 {
                self.center.x = 0
            }
            if self.center.x >= self.superview!.frame.maxX{
                self.center.x = self.superview!.frame.maxX
            }
          
              if self.center.y <= 0{
                self.center.y = 0
            }
            if self.center.y >= self.superview!.frame.maxY{
                self.center.y = self.superview!.frame.maxY
            }
           
        }
    
        }
    }
    
    /*
     
     gesture enable
     scale gesture
     on pan gesture if center is crossing edges dont pan in that direction anymore
     clip
     if child width is 1.5 X then dont scale
     
     */
    
    @objc func doubleTapped(){
       
        if isTapClicked {
        self.layer.borderWidth = 2
            print()
       isTapClicked = false
//            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [self] Timer in
//               
//                self.frame.origin = CGPoint(x:  self.frame.minX + 2, y: self.frame.minY + 2)
//                
//                 
//            }
        }
        else{
            self.layer.borderWidth = 0
            isTapClicked = true
        }
    }
   
}



