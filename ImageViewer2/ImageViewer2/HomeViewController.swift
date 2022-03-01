//
//  HomeViewController.swift
//  ImageViewer
//
//  Created by SimplyEntertaining on 1/20/22.
//

import UIKit
import PhotosUI

class HomeViewController: UIViewController, PHPickerViewControllerDelegate{
    var selectedImage:[UIImage] = []
    var totalConversionsCompleted = 0
    //It call on add or cancel button is selected
    @available(iOS 14, *)
  
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        //if result is empty it mean cancel button is pressed
            if results.isEmpty{
            self.dismiss(animated: false, completion: nil)
//            self.navigationController?.popViewController(animated: true)
        }
        //else add button is pressed
        else{
           
            //get every item from results array
        for item in results{
       // it load the data and error
            item.itemProvider.loadDataRepresentation(forTypeIdentifier: "public.image"){ [self]
                (data,error) in
                //check weather image is a type of uiimage
                if let image = UIImage(data:data!){
                    //store in array
                    selectedImage.append(image)
                    
                                   totalConversionsCompleted += 1
                    //check weather result index is same as array index
                    if totalConversionsCompleted == results.count  {
                        totalConversionsCompleted = 0
                        DispatchQueue.main.async  {
                            self.selectedImageViewToNextController(image: selectedImage)
                            selectedImage = []
                        }

                                   }
                    }
                   
                }
                
            }
           
        }
        
    }
    @IBOutlet weak var selectImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureItem()
        
    }
    func configureItem(){
       //let instance on navigation bar with property
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
       let navBar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: view.frame.size.width, height: 49))
       view.addSubview(navBar)
       let navItem = UINavigationItem(title: "Home")
       navBar.setItems([navItem], animated: false)
   }
    
    //to initiate imageviewerVC to add selected image in collection view
    func selectedImageViewToNextController(image:[UIImage]){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "ImageViewerViewController") as! ImageViewerViewController
        destination.selectedImage = image
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
    
    @IBAction func didSelectImageClicked(_ sender: UIButton) {
        presentPickerView()
        
        
    }
    //configure photopickerVC and make it delegate
    func presentPickerView(){
        //comfigure phpicker
       
        if #available(iOS 14, *) {
            var configuration:PHPickerConfiguration = PHPickerConfiguration()
            configuration.filter = PHPickerFilter.images
            configuration.selectionLimit = 3
            configuration.preferredAssetRepresentationMode = .current
            //create object of phpickerVC
            let picker:PHPickerViewController = PHPickerViewController(configuration:configuration)
            picker.delegate = self
            self.navigationController?.present(picker, animated: false, completion: nil)
        } else {
            // Fallback on earlier versions
        }
      
        
    }
}


