//
//  Game1WalkthroughView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game2WalkthroughView: View {
    @State private var selection = 0
    @Binding var isWalkthroughViewShowing: Bool
    
    var body: some View {
        ZStack{
            GameBackground(gameTitle: "La masse volumique pour créer des cocktails pour tes potes")
            VStack{
                Game2TabView(selection: $selection)
                    .padding(.top, 170)
            }
        }
        .transition(.move(edge: .bottom))
    }
}

struct Game2WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        Game2WalkthroughView(isWalkthroughViewShowing: Binding.constant(true))
    }
}
