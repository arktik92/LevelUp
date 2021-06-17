//
//  Game1Onboarding.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game1Onboarding: View {
    @State private var isWalkthroughViewShowing = true
    
    var body: some View {
        Group{
            if isWalkthroughViewShowing{
                Game1WalkthroughView(isWalkthroughViewShowing: $isWalkthroughViewShowing)
            } else {
                Text("hello").padding()
            }
        }
    }
}

struct Game1Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Game1Onboarding()
    }
}
