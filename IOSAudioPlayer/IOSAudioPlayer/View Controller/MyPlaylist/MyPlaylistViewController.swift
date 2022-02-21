//
//  PlaylistViewController.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/24/22.
//

import UIKit

// TODO: - PENDING
class MyPlaylistViewController: UIViewController{
   
@IBOutlet weak var myPlaylistCollectionView: UICollectionView!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarOfPlaylist()
        setCollectionViewCell()
        self.view.backgroundColor = themeColor.primary1Color
        configureCollectionView()
        self.view.frame.origin
      
    }
    
    func configureCollectionView(){
        let numberOfColumns : CGFloat = 2
//        let numberOfRows : CGFloat = 2
        
        
        myPlaylistCollectionView.delegate = self
        myPlaylistCollectionView.dataSource = self
       
        let customCellWidth = (self.myPlaylistCollectionView.frame.size.width*0.85)/numberOfColumns
        let cellSize = CGSize(width: customCellWidth, height: customCellWidth)
        let spacingOfCell = customCellWidth*0.09
        let layout  = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: spacingOfCell, left: spacingOfCell, bottom: spacingOfCell, right: spacingOfCell)
        layout.itemSize = cellSize
        myPlaylistCollectionView.setCollectionViewLayout(layout, animated: true)
        
    }
    
   
    

    func setNavBarOfPlaylist(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: view.frame.height*0.1))
        navBar.tintColor = themeColor.highlightColor
        navBar.barTintColor = themeColor.primary1Color
        navBar.titleTextAttributes = [.foregroundColor: themeColor.textColor1 as Any]
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "My Playlist")
        navItem.titleView?.backgroundColor = UIColor.clear
        navBar.setItems([navItem], animated: false)
    }

//     TODO: - PENDING
    @objc func addPlaylist(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "AddNewPlaylistViewController") as! AddNewPlaylistViewController

        navigationController?.pushViewController(destination, animated: true)
    }

    func pushToPlaylist(_ selectedAlbumIndex:Int){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "SelectedPlaylistViewController") as! SelectedPlayListViewController
        let selectedPlaylist = albumPlaylistArray[selectedAlbumIndex]
        destination.selectedAlbum = selectedPlaylist
        navigationController?.pushViewController(destination, animated: true)
    }


    func setCollectionViewCell(){
        let nibCell = UINib(nibName: "MyPlaylistCollectionCell", bundle: nil)
        myPlaylistCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        let addNewPlalistNibCell = UINib(nibName: "AddNewPlaylistCollectionViewCell", bundle: nil)
        myPlaylistCollectionView.register(addNewPlalistNibCell, forCellWithReuseIdentifier: "emptyCell")
        
    }



}




extension MyPlaylistViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
           
            let storyboard = UIStoryboard(name: "Main", bundle:Bundle.main)
            if #available(iOS 13.0, *) {
                let addNewPlaylistVC = storyboard.instantiateViewController(identifier: "AddNewPlaylistViewController") as! AddNewPlaylistViewController
                addNewPlaylistVC.delegate = self
                present(addNewPlaylistVC, animated: true, completion: nil)
            } else {
                let addNewPlaylistVC = storyboard.instantiateViewController(withIdentifier: "AddNewPlaylistViewController") as! AddNewPlaylistViewController
                addNewPlaylistVC.delegate = self
                navigationController?.pushViewController(addNewPlaylistVC, animated: true)
            }
           
        }
        else{
        pushToPlaylist(indexPath.row)
        print(indexPath.row)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("albumplaylisrcount:",albumPlaylistArray.count)
        return albumPlaylistArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row==0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emptyCell", for: indexPath) as! AddNewPlaylistCollectionViewCell
            return cell
        }
        else{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyPlaylistCollectionCell
       
       
            cell.configure(albumPlaylistArray[indexPath.row],indexPath)
            cell.delegate = self
        return cell
    }
    }

}
//extension MyPlaylistViewController:UICollectionViewDelegateFlowLayout{
//    //It will call one time for every item
//    //this is where we prepare layout of cell
//    //For current index please give me cell layout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //fix a width of cell half of width of collection view
//        let size = (collectionView.frame.size.width-30)/2
//        return CGSize(width: size, height: size)
//    }
//}

extension MyPlaylistViewController: UpdateNewPlaylist{
    func addAlbum(_ newPlaylist: AlbumStruct) {
        albumPlaylistArray.append(newPlaylist)
        print(newPlaylist)
        myPlaylistCollectionView.reloadData()
    }

}
extension MyPlaylistViewController:DeletePlaylistDelegate{
    func deletePlaylist(_ selectedindex: Int) {
        albumPlaylistArray.remove(at: selectedindex)
        myPlaylistCollectionView.reloadData()
    }
}
