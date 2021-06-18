//
//  Game3Onboarding.swift
//  LevelUp
//
//  Created by Lisa Mardjoeki on 16/06/2021.
//

import SwiftUI

struct Game3Onboarding: View {
    @State private var isWalkthroughViewShowing = true
    
    var body: some View {
        Group{
            if isWalkthroughViewShowing{
                Game3WalkthroughView(isWalkthroughViewShowing: $isWalkthroughViewShowing)
            } else {
                //Text("hello").padding()
            }
        }
    }
}

struct Game3Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Game3Onboarding()
    }
}
