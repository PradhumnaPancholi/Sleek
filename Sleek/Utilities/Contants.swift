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

//User Defaults//
var LOGGED_IN_KEY = "login"
var TOKEN_KEY = "token"
var USER_EMAIL = "userEmail"

//---------------------------------------------//
typealias CompletionHandler  =  (_ Success: Bool) -> ()

//URL Constants//
let BASE_URL = "https://sleek777.herokuapp.com/v1/"
let REGISTER_USER = "\(BASE_URL)account/register"

