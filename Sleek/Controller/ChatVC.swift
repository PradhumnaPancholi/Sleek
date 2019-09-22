//
//  ChatVC.swift
//  Sleek
//
//  Created by user148657 on 2/15/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets//
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var msgTxtBox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //for tableview//
        tableView.dataSource = self
        tableView.delegate = self
        //for row height//
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        //to use bindToKeyboard//
        view.bindToKeyboard()
        //tap gesture to close keyboard//
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.closeKeyboard))
        view.addGestureRecognizer(tap)
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
        //look for socket emit on "messageCreated" //
        SocketServices.instance.getMessage { (success) in
            if (success) {
                //reload table data on socket emit//
                self.tableView.reloadData()
                //to keep message table scrolled upto last message //
                if MsgServices.instance.messages.count > 0 {
                    let endIndex = IndexPath(row: MsgServices.instance.messages.count - 1, section: 0)
                    self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
                }
            }
        }
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
                //this channels exist, let first channel be the selected channel by default//
                if (MsgServices.instance.channels.count > 0){
                    MsgServices.instance.selectedChannel = MsgServices.instance.channels[0]
                    self.updateWithSelectedChannel()
                    
                }else{
                    self.nameLabel.text = "No Channels Yet"
                }
            }
        }
    }
    //for behaviour for selected channel //
    @objc func channelSelected(_ notif: Notification) {
        updateWithSelectedChannel()
    }
    
    //top show selected channel name//
    func updateWithSelectedChannel(){
        let channelName = MsgServices.instance.selectedChannel?.channelTitle ?? ""
        nameLabel.text = "#\(channelName)"
        //get msg for selected channel//
        getMessages()
    }
    
    //func to fetch Messages by channel//
    func getMessages(){
        guard let channelId = MsgServices.instance.selectedChannel?.id else { return }
        MsgServices.instance.getALLMessages(channelId: channelId) { (success) in
            //do stuff//
            if success {
                print("fetched messages")
                self.tableView.reloadData()
            }
        }
    }
    
    //for close keyboard gesture recog//
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    //func to send msg content & implement socket servcices to send message//
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        //check if logged in//
        if AuthService.instance.isLoggedin {
            guard let channelId = MsgServices.instance.selectedChannel?.id else { return }
            guard let msgBody = msgTxtBox.text else { return }
            SocketServices.instance.sendMessage(messageBody: msgBody, channelId: channelId) { (success) in
                if success {
                    //do stuff//
                    self.msgTxtBox.text = ""
                    print("Msg Sent")
                }
            }
        }
    }
    
    //For table view//
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MsgServices.instance.messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell{
            let message = MsgServices.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
        }else {
            return UITableViewCell()
        }
    }
}
