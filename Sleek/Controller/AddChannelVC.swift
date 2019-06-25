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
    
    //func to add channel when user pressed add channel//
    @IBAction func addChannelCreated(_ sender: Any) {
        guard let chanName = channelName.text as String? else { return }
        guard let chanDesc = channelDesc.text as String? else { return }
        
        //making request to server to create channel//
        SocketServices.instance.addChannel(channelName: chanName, channelDescription: chanDesc, completion: { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
