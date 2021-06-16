//
//  Onboarding.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView {
            Connexion()
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
