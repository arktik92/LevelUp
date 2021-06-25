//
//  Game1WalkthroughView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game2WalkthroughView: View {
    @Binding var startGame: Bool
    @Binding var popUpIsActive: Bool
    @State private var selection = 0
    @Binding var isWalkthroughViewShowing: Bool
    @State var isValidate = false
    var body: some View {
        ZStack{
            GameBackground(gameTitle: "La masse volumique pour créer des cocktails pour tes potes")
            VStack{
                Game2TabView(startGame: $startGame, popUpIsActive: $popUpIsActive, selection: $selection, isValidate: $isValidate)
                    .padding(.top, 170)
            }
            
            if isValidate {
                PopUpEndOfGame(player: PLAYER1, game: GAME2, win: true, popUpIsActive: $popUpIsActive, startGame: $startGame, isValidate: $isValidate)
                    .ignoresSafeArea()
            }
        }
        .transition(.move(edge: .bottom))
    }
}

struct Game2WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        Game2WalkthroughView(startGame: .constant(true), popUpIsActive: .constant(true), isWalkthroughViewShowing: .constant(true))
    }
}
