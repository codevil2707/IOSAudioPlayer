//
//  AddNewPlaylist.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/25/22.
//

import Foundation
import UIKit

//MARK: - delegate protocol for updating new playlist
protocol UpdateNewPlaylist{
    func addAlbum(_ newPlaylist:AlbumStruct)
}




//MARK: - View controller

class AddNewPlaylistViewController:UIViewController{
    
    
  
   //MARK: - variables
    @IBOutlet weak var addInPlaylistFromSonglistTableView:UITableView!
    @IBOutlet weak var fadedBackgroundLayer:UIView!
     var delegate:UpdateNewPlaylist?
     var arrayOfSong = [SongInfo]()
     var selectedSong = [SongInfo]()
     var newAlbumName:String?
    var newAlbumImage:UIImage?
    var doneButtonEnable:UIBarButtonItem?
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addInPlaylistFromSonglistTableView.delegate = self
        addInPlaylistFromSonglistTableView.dataSource = self
        addInPlaylistFromSonglistTableView?.allowsMultipleSelection = true
        setNavBarOfPlaylist()
    
       
       
    }

    
    override var prefersStatusBarHidden: Bool{
        return true
    }
   
    //MARK: - setup navigation bar button Action
    
   @objc func onDone(){
       if selectedSong.isEmpty == false {
           self.fadedBackgroundLayer.isHidden = false
           doneButtonEnable!.isEnabled = false
       let child = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
       self.add(child)
       child.delegate = self
           child.cancelButtonDelegate = self
       }
    }
    
    
    @objc func onClickedCancel(){
        navigationController?.popViewController(animated: true)
    }
    
  
//MARK: - setup Navigation Bar
    func setNavBarOfPlaylist(){
        let startingYPos : CGFloat = .zero;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: self.view.frame.width*0.1))
        navBar.tintColor = themeColor.highlightColor
        navBar.barTintColor = themeColor.primary1Color
        navBar.titleTextAttributes = [.foregroundColor: themeColor.textColor1 as Any]
        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Create Playlist")
        
      
        let add = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDone))
       
        let leftItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onClickedCancel))
       navItem.rightBarButtonItem = add
        navItem.leftBarButtonItem = leftItem
        doneButtonEnable = navItem.rightBarButtonItem!
        doneButtonEnable!.isEnabled = false
        navBar.setItems([navItem], animated: false)
    }
   
   
}

//MARK: - Delegate of song list table view
extension AddNewPlaylistViewController: UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        doneButtonEnable!.isEnabled = true
        if tableView.cellForRow(at: indexPath) != nil {
               
        selectedSong.append(arrayOfSong[indexPath.row])
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        if tableView.cellForRow(at: indexPath) != nil {
            
            let song =  arrayOfSong[indexPath.row]
         for item in selectedSong{
            if (item == song){
                selectedSong.remove(at: selectedSong.firstIndex(of: item)!)
            }
         }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSonglist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongListToAddPlaylistCell
        arrayOfSong.append(allSonglist[indexPath.row])
      print(arrayOfSong)
        cell.songNameLabel.text = allSonglist[indexPath.row].songName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width*0.1
    }
}

////MARK: - delegate of updateAlbumName
//extension AddNewPlaylistViewController: updateAlbumName{
//func setAlbumName(_ albumName: String){
//    newAlbumName = albumName
//    self.reloadInputViews()
//}
//}

////MARK: - collection view of images
//extension AddNewPlaylistViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//
//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return arrayOfImage.count
//}
//
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ArrayOfImagesCollectionViewCell
//    myCell.collectionImage.image = arrayOfImage[indexPath.row]
//    myCell.overlayLayer.isHidden = true
//
//            return myCell
//}
//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    let myCell = collectionView.cellForItem(at: indexPath) as! ArrayOfImagesCollectionViewCell
//    print("tapped")
//    myCell.overlayLayer.isHidden = false
//    myCell.isSelected = true
//    newAlbumImage = arrayOfImage[indexPath.row]
//}
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let myCell = collectionView.cellForItem(at: indexPath) as! ArrayOfImagesCollectionViewCell
//        myCell.overlayLayer.isHidden = true
//        myCell.isSelected = false
//    }
//}

//MARK: - extension for popup
@nonobjc extension UIViewController {
    func add(_ child: UIViewController) {
        
        self.addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        view.addConstraints([
//                      NSLayoutConstraint(item: child.view!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50),
//                      NSLayoutConstraint(item: child.view!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 20),
//                      NSLayoutConstraint(item: child.view!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
//                      NSLayoutConstraint(item: child.view!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
                      NSLayoutConstraint(item: child.view as Any, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.67, constant: 0),
                      NSLayoutConstraint(item: child.view as Any, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0),
                      NSLayoutConstraint(item: child.view as Any, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
                      NSLayoutConstraint(item: child.view as Any, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
                  ])
       
       
    }

    func remove() {
    
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension AddNewPlaylistViewController: PlaylistDelegate{
   
    
    func addPlaylistDelegate(_ playlistName: String, _ playlistImage: UIImage?) {
        newAlbumName = playlistName
        newAlbumImage = playlistImage
        let addPlaylist = AlbumStruct(albumName: newAlbumName, albumImage:newAlbumImage, albumPlaylist: selectedSong, albumMode: .User)
        self.delegate?.addAlbum(addPlaylist)
        navigationController?.popViewController(animated: true)
    }
}

extension AddNewPlaylistViewController:cancelDelegate{
    
    
    
    func cancelClicked() {
        self.fadedBackgroundLayer.isHidden = true
    }
}
