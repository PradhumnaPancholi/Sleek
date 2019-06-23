//
//  AddChannelVC.swift
//  Sleek
//
//  Created by Pradhumna Pancholi on 2019-06-22.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var channelName: UITextField!
    @IBOutlet weak var channelDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //to dismiss modal//
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
