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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //to load login View/Screen //
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedin{
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }
        else{
            performSegue(withIdentifier: TO_Login, sender: nil)            
        }
    }
    
}
