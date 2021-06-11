//
//  Planet.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

struct Planet : Identifiable {
    var id = UUID()
    var planetName : String
    var planetImg : String
    var planetDescription : String
    var planetGames : [Game]
}
