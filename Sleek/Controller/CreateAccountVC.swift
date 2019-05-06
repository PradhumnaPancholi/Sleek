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
    @IBOutlet weak var loader: UIActivityIndicatorView!//for loading sign//
    
    //variables//
    var avatarName = "user"//for default user image//
    var avatarColor = "[0.5,05,0.5,1]"//default//
    var avatarBGColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataServices.instance.avatarName != 	"" {
            userImg.image = UIImage(named: UserDataServices.instance.avatarName)
            avatarName = UserDataServices.instance.avatarName
        }
    }
    
    @IBAction func chooseAvtarPressed(_ sender: Any) {
        //to oerform segue to AvatarPickerVC//
        performSegue(withIdentifier: TO_Avatar_Picker, sender: nil)
    }
    
    //to make an API request using AuthService to create account//
    @IBAction func createAccountPressed(_ sender: Any) {
        //for loader//
        loader.isHidden = false
        loader.startAnimating()
        
        //to get data for parameters from textfield (with a check to handle exceptions)//
        guard let userName = userNameTxt.text, userNameTxt.text != "" else {
            return
        }
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
                        if success {
                            print("Loggen in")
                            AuthService.instance.createUser(name: userName, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                                print("User created")
                            NotificationCenter.default.post(name: NOTIF_USR_DATA_CHANGED, object: nil)	                            })
                        }
                    })
                    print("Registered User")
                    //for loader//
                    self.loader.stopAnimating()
                    self.loader.isHidden = true
                }
        }
    }
    
    //to generate a random background color for avatar//
    @IBAction func generateBGPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        
        avatarBGColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        //to make a transition with animationfade effect//
        UIView.animate(withDuration: 0.2) {
           self.userImg.backgroundColor = self.avatarBGColor
        }
    }
    
    //to dismiss Create Account View and load back to Channel View//
    @IBAction func closeBtnPressed(_ sender: Any) {
        //need to fix this with unwind segue for better UX//
        dismiss(animated: true, completion: nil)
    }
    

}
