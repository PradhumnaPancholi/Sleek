//
//  ProfileVCViewController.swift
//  Sleek
//
//  Created by user146928 on 4/4/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    //outlets//
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //to dismiss profile modalpresentation//
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPushed(_ sender: Any) {
        UserDataServices.instance.logout()
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        //for showing logged in user's data//
        userName.text = UserDataServices.instance.name
        userEmail.text = UserDataServices.instance.email
        userImg.image = UIImage(named: UserDataServices.instance.avatarName)
    }
}

