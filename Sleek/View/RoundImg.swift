//
//  RoundImg.swift
//  Sleek
//
//  Created by user148657 on 3/21/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImg: UIImageView {

    //to make sure that view id loaded before running the func//
    override func awakeFromNib() {
        setupView()
    }
    
    //for making image a circle//
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        prepareForInterfaceBuilder()
        setupView()        
    }
    
    
    

}
