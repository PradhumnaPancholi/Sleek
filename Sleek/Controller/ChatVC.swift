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
        
        //to check and recieve user data if logged in and broadcast the msg with notification//
        if AuthService.instance.isLoggedin {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USR_DATA_CHANGED, object: nil)
                
            }
        }
        //to get all channels//
        MsgServices.instance.getAllChannels { (success) in
            
        }
    }

}
