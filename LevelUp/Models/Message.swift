//
//  Message.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

struct Message : Identifiable {
    var id = UUID()
    var messageContent : String
    var hourMessage : Date
}
