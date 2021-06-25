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
    @State var isValidateWin = false
    @State var isValidateLose = false
    var body: some View {
        ZStack{
            GameBackground(gameTitle: "La science dans ton quotidien")
            VStack{
                Game2TabView(startGame: $startGame, popUpIsActive: $popUpIsActive, selection: $selection, isValidateWin: $isValidateWin,isValidateLose: $isValidateLose)
                    .padding(.top, 170)
            }
            
            if isValidateWin {
                PopUpEndOfGame(player: PLAYER1, game: GAME1, win: true, score: .constant(100), popUpIsActive: $popUpIsActive, startGame: $startGame, isValidate: $isValidateWin)
                    .ignoresSafeArea()
            }else if isValidateLose{
                PopUpEndOfGame(player: PLAYER1, game: GAME1, win: false, score: .constant(0), popUpIsActive: $popUpIsActive, startGame: $startGame, isValidate: $isValidateLose)
                    .ignoresSafeArea()
            }
        }.onAppear{
            audioPlayer?.numberOfLoops = -1
        }
        .transition(.move(edge: .bottom))
    }
}

struct Game2WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        Game2WalkthroughView(startGame: .constant(true), popUpIsActive: .constant(true), isWalkthroughViewShowing: .constant(true))
    }
}
