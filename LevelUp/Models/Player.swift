//
//  Player.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

class Player : ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var playerName : String = "Jo_LeG@Mer👾"
    @Published var playerImg : String = "astroProfil"
    @Published var totalEtoile : Int = 15
    @Published var totalPtsPro : Double = 3.0
    @Published var totalPtsHyg : Double = 12.0
    @Published var totalPtsQuo : Double = 4.0
    @Published var totalPtsSur : Double = 18.0
    @Published var totalPtsDevPer : Double = 7.0
    @Published var totalPtsPra : Double = 3.0
    @Published  var achievedGame:[String] = ["aaa","bbb","ccc","ddd","eee","ggg"]
    var achievments : [Achiev] = [.superStar, .megaStar, .propre1, .propre2, .survie1, .survie2, .padawanAstro]
    var unlockedPlanet : [Planet] = MY_PLANETS
}

extension Player {
    var data: [DataPoint] {
        return [DataPoint(quotidien: self.totalPtsQuo, devPerso: self.totalPtsDevPer, hygiene: self.totalPtsHyg, survie: self.totalPtsSur, pratique: self.totalPtsPra, professionnel: self.totalPtsPro, color: .red)]
    }
}
