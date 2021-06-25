//
//  Game1WalkthroughView.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game3WalkthroughView: View {
    @Binding var startGame: Bool
    @Binding var popUpIsActive: Bool
    @State private var selection = 0
    @Binding var isWalkthroughViewShowing: Bool
    @State var isValidatelose = false
    @State var isValidatewin = false
    @State var score = 0
    var body: some View {
        
        ZStack{
            GameBackground(gameTitle: "La Science dans la survie")
            VStack{
                Game3TabView(startGame:$startGame,popUpIsActive:$popUpIsActive,selection: $selection,isValidatelose: $isValidatelose, isValidatewin: $isValidatewin, score: $score)
                    .padding(.top, 100)
            }
            if isValidatewin {
                PopUpEndOfGame(player: PLAYER1, game: GAME2, win: true, score: $score, popUpIsActive: $popUpIsActive, startGame: $startGame, isValidate: $isValidatewin)
                
            } else if isValidatelose {
                PopUpEndOfGame(player: PLAYER1, game: GAME2, win: false, score: $score, popUpIsActive: $popUpIsActive, startGame: $startGame, isValidate: $isValidatelose)
            }
        }
        .transition(.move(edge: .bottom))
        .onAppear{
            audioPlayer?.numberOfLoops = -1
        }
    }
}


struct Game3WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        Game3WalkthroughView(startGame: .constant(true), popUpIsActive: .constant(true),isWalkthroughViewShowing: Binding.constant(true))
    }
}
