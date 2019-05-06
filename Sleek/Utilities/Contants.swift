//
//  Contants.swift
//  Sleek
//
//  Created by user148657 on 2/18/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation

//segues//
let TO_Login = "toLogin"
let TO_Create_Account = "toCreateAccount"
let UNWIND = "Unwind_Seague"
let TO_Avatar_Picker = "toAvatarPicker"

//notification constants//
let NOTIF_USR_DATA_CHANGED = Notification.Name("user_data_changed") 

//User Defaults//
var LOGGED_IN_KEY = "logged in"
var TOKEN_KEY = "token"
var USER_EMAIL = "userEmail"

//---------------------------------------------//
typealias CompletionHandler  =  (_ Success: Bool) -> ()

//URL Constants//
let BASE_URL = "https://sleek777.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
let LOGIN_URL = "\(BASE_URL)account/login"
let ADD_USER_URL = "\(BASE_URL)user/add"

//for header//
let HEADER = [
    "Content-Type": "Application/JSON; charset = utf-8"
]


