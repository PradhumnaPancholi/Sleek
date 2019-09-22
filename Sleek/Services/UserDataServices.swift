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
    public private(set) var id: String = ""
    public private(set) var name: String = ""
    public private(set) var email: String = ""
    public private(set) var avatarName: String = ""
    public private(set) var avatarColor: String = ""
    
    //to set user data/
    func setUserData(id: String, name: String, email: String, avatarName: String, avatarColor: String) {
        self.id = id
        self.name = name
        self.email = email
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    //func to logout//
    func logout() {
        id = ""
        name = ""
        email = ""
        avatarName = ""
        avatarColor = ""
        AuthService.instance.authToken = ""
        AuthService.instance.isLoggedin = false
        MsgServices.instance.cleanChannel()
        MsgServices.instance.cleanMessages()
    }
    
}

