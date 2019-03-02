//
//  UserDataServices.swift
//  Sleek
//
//  Created by user148657 on 3/2/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation

class UserDataServices {
   
    //to always have just one copy of UserDataServices running/stored//
    static let instance = UserDataServices()
    
    //variables for UserData//
    private(set) public var id: String = ""
    private(set) public var name: String = ""
    private(set) public var email: String = ""
    private(set) public var avatarName: String = ""
    private(set) public var avatarColor: String = ""
    
    //to set user data/
    func setUserData(id: String, name: String, email: String, avatarName: String, avatarColor: String) {
        self.id = id
        self.name = name
        self.email = email
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        
    }
    
    
}

