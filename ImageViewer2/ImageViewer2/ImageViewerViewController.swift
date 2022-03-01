//
//  ViewController.swift
//  ImageViewer
//
//  Created by SimplyEntertaining on 1/18/22.
//

import UIKit

class ImageViewerViewController: NavigationViewController {
   
    @IBOutlet var imageCollection: UICollectionView!
    //variables
   var selectedImageIndex:Int = 0
   var selectedImage:[UIImage]?

//Outlet of collectionView
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate of collectionView
       imageCollection.dataSource = self
        imageCollection.delegate = self

        let nibCell = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        imageCollection.register(nibCell, forCellWithReuseIdentifier: "cell")
    }
    //MARK: - override function
    //function to back button
    override func didClickedBackButton() {
       // Pop to the HomeView Controller
        navigationController?.popViewController(animated: true)
    }
   //function to next button
  override func didClickednext(){
      //herre we initiate view controller and push to imageView controller
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      let destination = storyboard.instantiateViewController(withIdentifier: "SelectedImageViewController") as! SelectedImageViewController
      destination.image = selectedImage![selectedImageIndex]
      navigationController?.pushViewController(destination, animated: true)
      
    }
    
  
}
//MARK: - Collection view delegate section

extension ImageViewerViewController:UICollectionViewDelegate{
    //Delegate notifying us
    //that item at current index path is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       //to get the cell object at selected indexPath
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        //highlight its background colour
        cell.isSelected = true
        cell.overLayerView.isHidden = false
       //store indexPath value in global variable
        selectedImageIndex = indexPath.row
        
    }
    //delgate notify us
    //that item at last inex path is selected
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        cell.isSelected = false
        cell.overLayerView.isHidden = true
    }
    
}
//MARK: - collection View Data Source Section

extension ImageViewerViewController:UICollectionViewDataSource{
    // data source asking
    //for this collection view how many sections do you want
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // i want one section
        return 1
    }
    
    // for current section how many items do you want
    //section = returns current section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // i want total number of item = colourData.count
        return selectedImage!.count    }
   
    // It will call one time for every item
    //This is where we prepare cell
    //For current index please give me a cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //create a reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        //set image to the collection cell from selected image
        cell.image.image = selectedImage![indexPath.row]
       
        cell.overLayerView.isHidden = true
        
        return cell
    }
    
    
}
//MARK: - Collection view delegate flow Layout Section
extension ImageViewerViewController:UICollectionViewDelegateFlowLayout{
    //It will call one time for every item
    //this is where we prepare layout of cell
    //For current index please give me cell layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //fix a width of cell half of width of collection view
        let size = (collectionView.frame.size.width-20)/2
        return CGSize(width: size, height: size)
    }
}

