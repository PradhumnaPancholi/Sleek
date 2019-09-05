//
//  MsgServices.swift
//  Sleek
//
//  Created by user146928 on 5/9/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MsgServices {
    
    static let instance = MsgServices()
    
    var channels = [Channel]()
    var selectedChannel : Channel?
    
    //a function to get all channels//
    func getAllChannels(completion: @escaping CompletionHandler){
        Alamofire.request(GET_ALL_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER ).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                if let json = try! JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let desc = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(id: id, channelTitle: name, channelDescription: desc)
                        self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
                
            }
        }
    }
    
    //function to clear all channels when user logs out //
    func cleanChannel() {
        channels.removeAll()
    }
    
}
