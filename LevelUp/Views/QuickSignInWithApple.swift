//
//  QuickSignInWithApple.swift
//  LevelUp
//
//  Created by esteban semellier on 15/06/2021.
//

import SwiftUI
import AuthenticationServices

struct QuickSignInWithApple: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
     
     func makeUIView(context: Context) -> UIViewType {
       return ASAuthorizationAppleIDButton()
       }
     
     func updateUIView(_ uiView: UIViewType, context: Context) {
     }
   }
struct QuickSignInWithApple_Previews: PreviewProvider {
    static var previews: some View {
        QuickSignInWithApple()
    }
}
