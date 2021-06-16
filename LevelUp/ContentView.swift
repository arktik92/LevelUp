//
//  ContentView.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_Status = false
    var body: some View {
        if log_Status {
            Universe()
        } else {
            Connexion()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad (8th generation)")
    }
}
