//
//  SignInApple.swift
//  LevelUp
//
//  Created by esteban semellier on 16/06/2021.
//

import SwiftUI
import AuthenticationServices

struct SignInGameCenter: View {
    @Binding var isGameCenterTaped: Bool
    var body: some View {
        Button(action: {
            self.isGameCenterTaped.toggle()
        }, label: {
            
                Rectangle()
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .frame(width: 300, height: 50, alignment: .center)
                    .padding()
                    .overlay(
                HStack {
                    
                    Image("logogamecenter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                        .padding()
                    Text("Connexion avec Game Center")
                        .fontWeight(.semibold)
                        .font(.custom("SFUIDisplay-Light", size: 18))
                        .foregroundColor(Color("bleuNuit"))
                        .padding(.horizontal, 30)
                }
            )
        }).fullScreenCover(isPresented: $isGameCenterTaped, content: {
            ConnectionView()
        })
    }
}

