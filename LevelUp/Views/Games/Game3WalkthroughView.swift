//
//  Game1WalkthroughView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game3WalkthroughView: View {
    @State private var selection = 0
    @Binding var isWalkthroughViewShowing: Bool
    
    var body: some View {
        ZStack{
            GameBackground(gameTitle: "La Science dans la survie")
            VStack{
                Game3TabView(selection: $selection)
                    .padding(.top, 100)
            }
        }
        .transition(.move(edge: .bottom))
    }
}

struct Game3WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        Game3WalkthroughView(isWalkthroughViewShowing: Binding.constant(true))
    }
}
