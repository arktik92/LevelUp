//
//  Game.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

struct Game : Identifiable, Equatable {
    
    var id = UUID()
    var gameName : String
    var gameImg : String
    var gameShortDescription: String
    var gameDescription: String
    var nbEtoile: Int
    var gameType: [Type]
    var nbPtsPro : Int
    var nbPtsHyg : Int
    var nbPtsQuo: Int
    var nbPtsSur: Int
    var nbPtsDevPer: Int
    var nbPtsPra: Int
}
