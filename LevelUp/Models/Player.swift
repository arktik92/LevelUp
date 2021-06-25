//
//  Player.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

class Player : ObservableObject, Identifiable {
    var id = UUID()
    var playerName : String = ""
    var playerImg : String = ""
   @Published var totalEtoile : Int = 0
    var totalPtsPro : Double = 0.0
    var totalPtsHyg : Double = 0.0
    var totalPtsQuo : Double = 0.0
    var totalPtsSur : Double = 0.0
    var totalPtsDevPer : Double = 0.0
    var totalPtsPra : Double = 0.0
    var achievments : [Achiev] = []
    var achievedGame:[Game] = []
    var unlockedPlanet : [Planet] = MY_PLANETS
}

extension Player {
    var data: [DataPoint] {
        return [DataPoint(quotidien: self.totalPtsQuo, devPerso: self.totalPtsDevPer, hygiene: self.totalPtsHyg, survie: self.totalPtsSur, pratique: self.totalPtsPra, professionnel: self.totalPtsPro, color: .red)]
    }
}
