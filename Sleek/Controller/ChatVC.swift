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

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // To make sidebar work with SWReveal and Views.
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        //To add "drag" gesture for sidebar//
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //To add "Tap" gesture to close SideBar//
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        //Notification observer when user data changes//
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USR_DATA_CHANGED, object: nil)
        //Notification observer when user selects a channel//
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        //to check and recieve user data if logged in and broadcast the msg with notification//
        if AuthService.instance.isLoggedin {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USR_DATA_CHANGED, object: nil)
            }
        }
    }
    
    //to load channels when user data changess //
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedin {
            onLoginGetMessages()
        }else{
           //show msg to login //
            nameLabel.text = "Please Log In"
        }
    }
    //func to get channels & messages on login //
    func onLoginGetMessages() {
        MsgServices.instance.getAllChannels { (success) in
            if (success){
                //do stuff for messages//
            }
        }
    }
    //for behaviour for selected channel //
    @objc func channelSelected(_ notif: Notification) {
        updateWithSelectedChannel()
    }
    
    func updateWithSelectedChannel(){
        let channelName = MsgServices.instance.selectedChannel?.channelTitle ?? ""
        nameLabel.text = "#\(channelName)"
    }

}
