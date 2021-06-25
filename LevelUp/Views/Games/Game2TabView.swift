//
//  Game2TabView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 17/06/2021.
//

import SwiftUI

struct Game2TabView: View {
    @Binding var startGame: Bool
    @Binding var popUpIsActive: Bool
    @Binding var selection: Int
    @Binding var isValidate : Bool
    var body: some View {
      
            TabView(selection: $selection) {
                ForEach(game2Views.indices, id: \.self) { index in
                    if game2Views[index] is Game2 {
                        Game2(StartGame: $startGame, myGameDrag: GAME1, isValidate: $isValidate, popUpIsActive: $popUpIsActive)
                    } else {
                        Game2(StartGame: $startGame, myGameDrag: GAME1, isValidate: $isValidate, popUpIsActive: $popUpIsActive)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
           
        
    }
}

struct Game2TabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gameTitle: "La science dans la survie")
            Game1TabView(selection: Binding.constant(0))
        }
    }
}
