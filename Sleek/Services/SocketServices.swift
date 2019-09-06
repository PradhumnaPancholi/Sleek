//
//  SocketServices.swift
//  Sleek
//
//  Created by Pradhumna Pancholi on 2019-06-24.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation
import SocketIO

class SocketServices: NSObject {
    
    static let instance = SocketServices()
    let manager: SocketManager
    let socket: SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
    }
    
    //function to establish a connection//
    func establishConnection() {
        socket.connect()
    }
    
    //function to close connection//
    func closeConnection() {
        socket.disconnect()
    }
    
    //function to add a channel//
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        print("this is from addchannel function")
        completion(true)
    }
    
    //function to recieve channels//
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (data, ack ) in
            guard let channelName = data[0] as? String else {return}
            guard let channelDesc = data[1] as? String else {return}
            guard let channelID = data[2] as? String else {return}
            //creating new channel object//
            let newChannel = Channel(id: channelID, channelTitle: channelName, channelDescription: channelDesc)
            //appending newchannel to channels array//
            MsgServices.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    //func to send msg//
    func sendMessage(messageBody: String, channelId: String, completion: @escaping CompletionHandler){
        let user = UserDataServices.instance
        socket.emit("newMessage", messageBody, user.id, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
}
