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
       
      
//        AddNewPlaylistViewController.delegate = self
    }
    
    func configureCollectionView(){
        let numberOfColumns : CGFloat = 2
        let numberOfRows : CGFloat = 2
        
        
        myPlaylistCollectionView.delegate = self
        myPlaylistCollectionView.dataSource = self
       
        let customCellWidth = (self.myPlaylistCollectionView.frame.size.width*0.9)/numberOfColumns
        let cellSize = CGSize(width: customCellWidth, height: customCellWidth)
        let spacingOfCell = customCellWidth*0.05
        let layout  = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: spacingOfCell, left: spacingOfCell, bottom: spacingOfCell, right: spacingOfCell)
        layout.itemSize = cellSize
        myPlaylistCollectionView.setCollectionViewLayout(layout, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myPlaylistCollectionView.reloadData()
       
    }
    

    func setNavBarOfPlaylist(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: 50))
        navBar.backgroundColor = UIColor.clear
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "My Playlist")
        navItem.titleView?.backgroundColor = UIColor.clear
//        let leftItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlaylist))

//       navItem.leftBarButtonItem = leftItem
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
        let addNewPlaylistVC = storyboard.instantiateViewController(identifier: "AddNewPlaylistViewController") as! AddNewPlaylistViewController
            present(addNewPlaylistVC, animated: true, completion: nil)
        }
        else{
            

        pushToPlaylist(indexPath.row)
        print(indexPath.row)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumPlaylistArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row==0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emptyCell", for: indexPath) as! AddNewPlaylistCollectionViewCell
            return cell
        }
        else{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyPlaylistCollectionCell
       
       if  let imageOfAlbum = albumPlaylistArray[indexPath.row].albumImage,
           let nameOfAlbum = albumPlaylistArray[indexPath.row].albumName {
        cell.configure(imageOfAlbum, nameOfAlbum)
       }
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
    }

}
