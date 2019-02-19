//
//  CreateAccountVC.swift
//  Sleek
//
//  Created by user148657 on 2/19/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //to dismiss Create Account View and load back to Channel View//
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
