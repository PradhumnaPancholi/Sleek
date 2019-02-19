//
//  ChatVC.swift
//  Sleek
//
//  Created by user148657 on 2/15/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //outlets//
    @IBOutlet weak var menuBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // To make sidebar work with SWReveal and Views.
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        //To add "drag" gesture for sidebar//
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //To add "Tap" gesture to close SideBar//
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
      
    }

}
