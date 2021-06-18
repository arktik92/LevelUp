//
//  Game3TabView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game3TabView: View {
    @Binding var selection: Int
    var body: some View {
        TabView(selection: $selection) {
            ForEach(game3Views.indices, id: \.self) { index in
                if game3Views[index] is Game3 {
                    Game3(player: PLAYER1, planetImg: "")
                } else if game3Views[index] is QuizView{
                    QuizView(planetImg: "", player: PLAYER1, showGame: .constant(true))
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Game3TabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gameTitle: "La science dans la survie")
            Game3TabView(selection: Binding.constant(0))
        }
    }
}
