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
    
    //a function to get all channels//
    func getAllChannel(){
        Alamofire.request(GET_ALL_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                if let json = try! JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let desc = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(id: id, channelTitle: name, channelDescription: desc)
                        self.channels.append(channel)
                        debugPrint(self.channels)
                    }
                    print(self.channels[0].channelTitle)
                    //completion(true)
                }else {
                    //completion(false)
                    debugPrint(response.result.error as Any)
                }
                
            }
        }
    }
}
