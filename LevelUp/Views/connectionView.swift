//
//  MenuView.swift
//  LevelUp
//
//  Created by esteban semellier on 14/06/2021.
//

import SwiftUI

import GameKit
struct ConnectionView: View {
    let localPlayer = GKLocalPlayer.local
    func authenticateUser() {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
        }
    }
    var body: some View {
        NavigationView {
            NavigationLink(destination: PlanetView(planet: PLANET1, player: PLAYER1)) {
                Text("LevelUp")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            authenticateUser()
        }
    }
}


struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
