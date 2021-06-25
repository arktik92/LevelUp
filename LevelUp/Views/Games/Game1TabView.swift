//
//  Game1TabView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game1TabView: View {
    @Binding var selection: Int
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(game1Views.indices, id: \.self) { index in
                if game1Views[index] is Game1 {
                    Game1()
                } else if game1Views[index] is Game1e2{
                    Game1e2()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Game1TabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground( gameTitle: "")
            Game1TabView(selection: Binding.constant(0))
        }
    }
}
