//
//  Conversation.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

struct Conversation : Identifiable {
    
    var id = UUID()
    var friendName : String
    var friendImg : String
    var friendMessages : [Message]
    var myMessages : [Message]
}
