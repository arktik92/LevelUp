//
//  Question.swift
//  LevelUp
//
//  Created by Mac n°26 on 15/06/2021.
//

import SwiftUI

struct Question : Identifiable{
    var id = UUID()
    var question : String
    var reponses: [String]
    var reponse : Int
    var selectedInt : Int
}
