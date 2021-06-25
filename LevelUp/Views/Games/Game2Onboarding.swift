//
//  Game2Onboarding.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 17/06/2021.
//

import SwiftUI

struct Game2Onboarding: View {
    @State private var isWalkthroughViewShowing = true
    @Binding var startGame: Bool
    @Binding var popUpIsActive: Bool
    @State var isValidate = false
    var body: some View {
        ZStack{
            
                    if isWalkthroughViewShowing{
                Game2WalkthroughView(startGame: $startGame, popUpIsActive: $popUpIsActive, isWalkthroughViewShowing: $isWalkthroughViewShowing)
            } else {
                //Text("hello").padding()
            
        }
    }
   
    }
    
    
}

struct Game2Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Game2Onboarding(startGame: .constant(true), popUpIsActive: .constant(true))
    }
}
