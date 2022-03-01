//
//  ViewController.swift
//  ImageViewer
//
//  Created by SimplyEntertaining on 1/19/22.
//

import UIKit

class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     configureItem()
    }
    //create a private function for define navigation bar
     func configureItem(){
        //let instance on navigation bar with property
         let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: view.frame.size.width, height: 49))
        view.addSubview(navBar)
    
        let navItem = UINavigationItem(title: "Images")
         let leftItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(didClickedBackButton))
         let rightItem = UIBarButtonItem(image: UIImage(named: "next"), style: .plain, target: self, action: #selector(didClickednext))
         navItem.rightBarButtonItem = rightItem
        navItem.leftBarButtonItem = leftItem
         navItem.hidesBackButton = true
    

        navBar.setItems([navItem], animated: false)
    }

    @objc func didClickedBackButton(){
        navigationController?.popToRootViewController(animated: true)
        
    }
    @objc func didClickednext(){
        navigationController?.popToRootViewController(animated: true)
    }
}
