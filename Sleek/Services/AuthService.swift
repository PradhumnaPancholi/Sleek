//
//  AuthServices.swift
//  Sleek
//
//  Created by user148657 on 2/22/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
    
    //function to make request to the API to register a new user//

    func registerUser(email: String, password: String, completion: @escaping CompletionHandler ) {
   
        //preparing data for request//
        
        //to turn email into lowercase//
        let lowerCaseEmail = email.lowercased()

        //for data that will be sent in request//
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        //to make request to register a new user//
        Alamofire.request(REGISTER_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.error == nil{
                completion(true)
            }
            else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
        
    //function to make request to the API to login a new user//
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler ) {
        //preparing data for request//
        
        //to turn email into lowercase//
        let lowerCaseEmail = email.lowercased()
        
        //for data that will be sent in request//
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        //to make request to login a user//
        Alamofire.request(LOGIN_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON{
            	(response) in
                /*if response.result.error == nil {
                    if let json = response.result.error as? Dictionary<String, Any> {
                        if let email = json["user"] as? String{
                            self.userEmail = email
                        }
                        if let token = json["token"] as? String{
                            self.authToken = token
                        }
                    }
                }*/
                
               if response.result.error == nil{
                    guard let data = response.data else {return}
                    let json = try! JSON(data: data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                    self.isLoggedin = true
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
     }

    
}
