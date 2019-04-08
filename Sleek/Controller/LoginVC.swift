//
//  LoginVC.swift
//  Sleek
//
//  Created by user148657 on 2/19/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //outlets//
    
    @IBOutlet weak var email: UITextField!    
    @IBOutlet weak var password: UITextField!    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        loader.isHidden = true
    }
    //to close/dismiss Login VC//
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    //to load Create Account VC//
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_Create_Account, sender: nil)
    }
    //to login user//
    @IBAction func loginBtnPressed(_ sender: Any) {
        loader.isHidden = false
        loader.startAnimating()
        //to get input value and make sure it's not empty//
        guard let userEmail = email.text, email.text != "" else {
            return
        }
        guard let userPassword = password.text, password.text != "" else {
            return
        }
        AuthService.instance.loginUser(email: userEmail, password: userPassword, completion: { (success) in
            if success{
                print("You are Logged In")
                //for loader//
                self.loader.stopAnimating()
                self.loader.isHidden = true
                //to dismiss segue//
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
