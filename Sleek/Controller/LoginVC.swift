//
//  LoginVC.swift
//  Sleek
//
//  Created by user148657 on 2/19/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    //to close/dismiss Login VC//
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    //to load Create Account VC//
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_Create_Account, sender: nil)
    }
}
