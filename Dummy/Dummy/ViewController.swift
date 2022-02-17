//
//  ViewController.swift
//  Dummy
//
//  Created by SimplyEntertaining on 2/17/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var view2:UIView!
    
    var viewChild = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
    var viewChild2 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Did Load -> ")
        print("DL view1 Frames:", view.frame)
        print("DL view2 Frames:", view2.frame)
        
        print("DL view1 Bounds:", view.bounds)
        print("DL view2 Bounds:" ,view2.bounds)
        print("\n------> ")
        
        self.view.addSubview(viewChild)
        viewChild.backgroundColor = .red
        self.view.addSubview(viewChild2)
        viewChild2.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
//        print("Did Appear -> ")
//        print("view1 Frames:", view.frame)
//        print("view2 Frames:", view2.frame)
//
//        print("view1 Bounds:", view.bounds)
//        print("view2 Bounds:" ,view2.bounds)
//        print("\n------> ")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3.0) { [self] in
            viewChild.frame = CGRect(origin: .zero, size:  self.view2.frame.size)
            viewChild2.frame = CGRect(origin: .zero, size:  self.view2.frame.size)

//            self.view.addSubview(viewChild)
        }
    }
    
    override func viewWillLayoutSubviews() {
        print("WILL - LayOut Subviews -> ")
        print(" view1 Frames:", view.frame)
        print(" view2 Frames:", view2.frame)

        print(" view1 Bounds:", view.bounds)
        print(" view2 Bounds:" ,view2.bounds)
        print("\n------> ")
    }
    
    override func viewDidLayoutSubviews() {
        print("DID - LayOut Subviews -> ")
        print(" view1 Frames:", view.frame)
        print(" view2 Frames:", view2.frame)
        
        print(" view1 Bounds:", view.bounds)
        print(" view2 Bounds:" ,view2.bounds)
        print("\n------> ")
    }
    
    
}

