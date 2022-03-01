//
//  SonglistTableViewController.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/24/22.
//

import Foundation
import UIKit

class SelectedPlayListViewController:UIViewController{
   
    
    var selectedAlbum:AlbumStruct?
    var selectedIndex:Int?
   
    @IBOutlet weak var selectedPlayListTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPlayListTableView.dataSource = self
        selectedPlayListTableView.delegate = self
        setNavBarOfSonglist()
        setTableViewCell()
        
       
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
   
    
    func setTableViewCell(){
        let nibCell = UINib(nibName: "SelectedPlaylistTableViewCell", bundle: nil)
        selectedPlayListTableView.register(nibCell, forCellReuseIdentifier: "cell")
        let lastCellNib = UINib(nibName: "LastCellOfTableViewCell", bundle: nil)
        selectedPlayListTableView.register(lastCellNib, forCellReuseIdentifier: "lastCell")
        let firstCellNib = UINib(nibName: "FirstCellOfTableViewCell", bundle: nil)
        selectedPlayListTableView.register(firstCellNib, forCellReuseIdentifier: "firstCell")
        
    }
    
    
    func setNavBarOfSonglist(){
        let startingYPos : CGFloat = .zero;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: 50))
        navBar.tintColor = themeColor.highlightColor
        navBar.barTintColor = themeColor.primary1Color
        navBar.titleTextAttributes = [.foregroundColor: themeColor.textColor1 as Any]
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Songlist")
        let leftItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onClickedCancel))

       navItem.leftBarButtonItem = leftItem
        navBar.setItems([navItem], animated: false)
    }
    @objc func onClickedCancel(){
        navigationController?.popViewController(animated: true)
    }
    
    func pushToMusicPlayer(selectedIndexPath:Int){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "AudioPlayerViewController") as! AudioPlayerViewController
        destination.albumName = selectedAlbum?.albumName
        destination.playerLogic.songlist = (selectedAlbum?.albumPlaylist)!
        destination.playerLogic.currentSongIndex = selectedIndexPath
        navigationController?.pushViewController(destination, animated: true)
        
    }
}
extension SelectedPlayListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row != 0 && indexPath.row != (selectedAlbum?.albumPlaylist!.count)!+1{
            pushToMusicPlayer(selectedIndexPath: indexPath.row-1)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (selectedAlbum?.albumPlaylist?.count ?? 0) + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
      

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstCellOfTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            cell.configureCell(selectedAlbum!)
            return cell
        }
        else if indexPath.row == (selectedAlbum?.albumPlaylist!.count)!+1{
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "lastCell", for: indexPath) as! LastCellOfTableViewCell
            cell.selectionStyle = .none
            cell.configureCell(selectedPlaylist: selectedAlbum!)
            return cell
        }
        else{
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectedPlaylistTableViewCell
           // cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            cell.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cell.configureCell(selectedAlbum!,cellIndex: indexPath)
        return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.height*0.6
            
        }
        else if indexPath.row == (selectedAlbum?.albumPlaylist!.count)!+1{
            return self.view.frame.height*0.2

        }
        else {
            
            return self.view.frame.height*0.1
            
            
        }
    }
    
}

extension SelectedPlayListViewController:playButtonDeelegate{
func playButtonClicked(_ action: Bool) {
    if action {
        pushToMusicPlayer(selectedIndexPath: 0)
    }
}
}
