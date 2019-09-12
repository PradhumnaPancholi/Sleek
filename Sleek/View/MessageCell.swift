//
//  MessageCell.swift
//  Sleek
//
//  Created by Pradhumna Pancholi on 2019-09-07.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //outlets//
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var msgBodyLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(message: Message){
        userImg.image = UIImage(named: message.userAvatar ?? "ggggg")
        userNameLabel.text = message.userName
        msgBodyLabel.text = message.messageBody
    }

}
