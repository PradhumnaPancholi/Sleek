//
//  CreateAccountVC.swift
//  Sleek
//
//  Created by user148657 on 2/19/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets//
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseAvtarPressed(_ sender: Any) {
    }
    
    //to make an API request using AuthService to create account//
    @IBAction func createAccountPressed(_ sender: Any) {
        
        //to get data for parameters from textfield (with a check to handle exceptions)//
        guard let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        guard let password = passwordTxt.text, passwordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) {
            (success) in
                if success {
                    AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                        if success{
                            print("Logged in succesfully")
                        }
                        print("login failed")
                    })
                   // print("Registered User")
                }
        }
    }
    //to dismiss Create Account View and load back to Channel View//
    @IBAction func closeBtnPressed(_ sender: Any) {
        //need to fix this with unwind segue for better UX//
        dismiss(animated: true, completion: nil)
    }
    

}
