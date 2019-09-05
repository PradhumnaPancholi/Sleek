//
//  ChannelCell.swift
//  Sleek
//
//  Created by Pradhumna Pancholi on 2019-05-17.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    //outlets//
    @IBOutlet weak var channelTitle: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //configure cell/
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        self.channelTitle.text = "# \(title)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if (selected) {
            self.backgroundColor = UIColor(white: 1, alpha: 0.2)
        }else {
            self.backgroundColor = UIColor.clear
        }
        
    }

}
