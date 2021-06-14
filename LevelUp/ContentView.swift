//
//  ContentView.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import SwiftUI

struct ContentView: View {
    var planet: Planet
    var player: Player
    
    var body: some View {
        ConnectionView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(planet: PLANET8, player: PLAYER1)
    }
}
