//
//  ChannelVC.swift
//  Sleek
//
//  Created by user148657 on 2/15/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    //outlets//
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImg: RoundImg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 40
        NotificationCenter.default.addObserver(self, selector: #selector(userDataChanged(_:)), name: NOTIF_USR_DATA_CHANGED, object: nil)
        
        //to recieve channels continuesly//
        SocketServices.instance.getChannel { (success) in
            if success{
                self.tableView.reloadData()
            }
        }
    }
    //to look for user data before view loads
    override func viewDidAppear(_ animated: Bool) {
        setUpUserInfo()
    }
    //to load modal to add new channel//
    @IBAction func addChannelPressed(_ sender: Any) {
        if (AuthService.instance.isLoggedin){
            let addChannelModal = AddChannelVC()
            addChannelModal.modalPresentationStyle = .custom
            present(addChannelModal, animated: true, completion: nil)
        }
    }
    //to load login modal View/Screen //
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedin {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            print(AuthService.instance.isLoggedin)
        }
        else{
            performSegue(withIdentifier: TO_Login, sender: nil)
        }
    }
    
    //to manage user data when notification post happens//
    @objc func userDataChanged(_ notif: Notification) {
        setUpUserInfo()
    }
    
    //to set user info//
    func setUpUserInfo() {
        if (AuthService.instance.isLoggedin) {
            loginBtn.setTitle(UserDataServices.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataServices.instance.avatarName)
        }
        else{
            loginBtn.setTitle("Log In", for: .normal)
            userImg.image = UIImage(named: "user")
            tableView.reloadData()
        }
    }
    
    //for tablView----------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MsgServices.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MsgServices.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            
           return cell
        }else {
            return UITableViewCell()
        }
    }
    
}
