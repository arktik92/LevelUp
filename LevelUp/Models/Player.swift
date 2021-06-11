//
//  Player.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

struct Player : Identifiable {
    var id = UUID()
    var playerName : String
    var playerImg : String
    var totalEtoile : Int
    var totalPtsPro : Int
    var totalPtsHyg : Int
    var totalPtsQuo : Int
    var totalPtsSur : Int
    var totalPtsDevPer : Int
    var totalPtsPra : Int
    var achievments : [Achiev]
    var achievedGame:[String]
    var unlockedPlanet : [String]
}
