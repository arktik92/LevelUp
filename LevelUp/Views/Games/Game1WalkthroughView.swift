//
//  Game1WalkthroughView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game1WalkthroughView: View {
    @State private var selection = 0
    @Binding var isWalkthroughViewShowing: Bool
    
    var body: some View {
        ZStack{
            GameBackground( gameTitle: "La science dans la survie")
            VStack{
                Game1TabView(selection: $selection)
                    .padding(.top, 100)
            }
        }
        .transition(.move(edge: .bottom))
    }
}

struct Game1WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        Game1WalkthroughView(isWalkthroughViewShowing: Binding.constant(true))
    }
}
