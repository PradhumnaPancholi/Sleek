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
let NOTIF_CHANNELS_LOADED = Notification.Name("channels_loaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channel_selected")

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
let FIND_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let ADD_USER_URL = "\(BASE_URL)user/add"
let GET_ALL_CHANNELS = "\(BASE_URL)channel"
let GET_ALL_MESSAGES = "\(BASE_URL)/message/byChannel/"

//for header//
let HEADER = [
    "Content-Type": "Application/JSON; charset = utf-8"
]

let BEARER_HEADER = [
    "Content-Type": "Application/JSON; charset = utf-8",
    "Authorization": "Bearer \(AuthService.instance.authToken)"
]


