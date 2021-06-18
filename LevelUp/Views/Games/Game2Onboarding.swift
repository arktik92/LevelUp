//
//  Game2Onboarding.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 17/06/2021.
//

import SwiftUI

struct Game2Onboarding: View {
    @State private var isWalkthroughViewShowing = true
    
    var body: some View {
        Group{
            if isWalkthroughViewShowing{
                Game2WalkthroughView(isWalkthroughViewShowing: $isWalkthroughViewShowing)
            } else {
                //Text("hello").padding()
            }
        }
    }
}

struct Game2Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Game2Onboarding()
    }
}
