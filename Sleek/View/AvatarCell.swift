//
//  AvatarCellCollectionViewCell.swift
//  Sleek
//
//  Created by user148657 on 3/3/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class AvatarCell : UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    //function to manage/add images for avatars//
    func configureCell(index: Int){
        avatarImg.image = UIImage(named:"avatar\(index)")
    }
}
