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
    var totalPtsPro : Double
    var totalPtsHyg : Double
    var totalPtsQuo : Double
    var totalPtsSur : Double
    var totalPtsDevPer : Double
    var totalPtsPra : Double
    var achievments : [Achiev]
    var achievedGame:[Game]
    var unlockedPlanet : [Planet]
}

extension Player {
    var data: [DataPoint] {
        return [DataPoint(quotidien: self.totalPtsQuo, devPerso: self.totalPtsDevPer, hygiene: self.totalPtsHyg, survie: self.totalPtsSur, pratique: self.totalPtsPra, professionnel: self.totalPtsPro, color: .red)]
    }
}
