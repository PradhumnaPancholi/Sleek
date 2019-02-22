//
//  AuthServices.swift
//  Sleek
//
//  Created by user148657 on 2/22/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation

class AuthService {
    
    static let instance = AuthService()
    
    //To store defaults that will be persisted after even after app being closed. So that users don't have to sign in again//
    let defaults = UserDefaults.standard
    
    var isLoggedin : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }

    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
}
