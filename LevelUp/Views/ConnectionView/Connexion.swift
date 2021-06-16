//
//  Connexion.swift
//  LevelUp
//
//  Created by Laura LONG on 14/06/2021.
//
import Firebase
import SwiftUI
import AuthenticationServices
import GameKit

struct Connexion: View {
    @State private var username: String = ""
    @State private var password = ""
    @State private var showField : Bool = false
    @State private var user: User?
    @State private var showMain: Bool = false
    @State private var isGamecenterTaped = false
    var body: some View {
        ZStack {
            Color("bleuNuit")
                .edgesIgnoringSafeArea(.all)
            Image("fondEtoile")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Image("levelup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                SignInEmail(showField: $showField, username: $username, password: $password, showMain: $showMain, user: $user)
                SignInGameCenter(isGameCenterTaped: $isGamecenterTaped)
                Spacer()
                SignInApple()
                Spacer()
            }
        }.statusBar(hidden: true)
    }
}

//-------------------preview----------------------------------------------
struct Connexion_Previews: PreviewProvider {
    static var previews: some View {
        Connexion()
    }
}

