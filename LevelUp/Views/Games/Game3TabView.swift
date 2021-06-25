//
//  Game3TabView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game3TabView: View {
    @Binding var startGame: Bool
    @Binding var popUpIsActive: Bool
    @Binding var selection: Int
    @Binding var isValidatelose : Bool
    @Binding var isValidatewin : Bool
    @Binding var score: Int
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ForEach(game3Views.indices, id: \.self) { index in
                    if game3Views[index] is Game3 {
                        Game3(player: PLAYER1, planetImg: "", popUpIsActive: $popUpIsActive, startGame: $startGame)
                    } else if game3Views[index] is QuizView{
                        QuizView(planetImg: "", startGame: $startGame,popUpIsActive:$popUpIsActive, isValidatelose: $isValidatelose, isValidatewin: $isValidatewin
                                 , player: PLAYER1, score: $score)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
        }
    }
}

struct Game3TabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gameTitle: "La science dans la survie")
            Game3TabView(startGame:.constant(true),popUpIsActive:.constant(true),selection: Binding.constant(0), isValidatelose: .constant(true), isValidatewin: .constant(true), score: .constant(0))
        }
    }
}
