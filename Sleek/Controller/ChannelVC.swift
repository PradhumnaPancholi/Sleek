//
//  ChannelVC.swift
//  Sleek
//
//  Created by user148657 on 2/15/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
   
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var userImg: RoundImg!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(userDataChanged(_:)), name: NOTIF_USR_DATA_CHANGED, object: nil)
    }
    //to load login View/Screen //
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
    
    @objc func userDataChanged(_ notif: Notification) {
        if (AuthService.instance.isLoggedin) {
            loginBtn.setTitle(UserDataServices.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataServices.instance.avatarName)
            }
        else{
            loginBtn.setTitle("Log In", for: .normal)
            userImg.image = UIImage(named: "user")
        }
    }
    
}
