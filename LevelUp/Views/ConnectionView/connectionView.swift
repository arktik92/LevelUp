//
//  MenuView.swift
//  LevelUp
//
//  Created by esteban semellier on 14/06/2021.
//

import SwiftUI
import GameKit


struct ConnectionView: View {
    @State var pass = false
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
            NavigationLink(
                "", destination: Universe(),
                isActive: .constant(true)
            )
        }
        .navigationBarBackButtonHidden(true)
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
