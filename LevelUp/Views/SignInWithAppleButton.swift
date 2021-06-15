//
//  SignInWithAppleButton.swift
//  LevelUp
//
//  Created by esteban semellier on 15/06/2021.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: View {
    var colorScheme: ColorScheme = .dark
  
  var body: some View {
    Group {
      if colorScheme == .light {
        SignInWithAppleButtonInternal(colorScheme: .light)
      }
      else {
        SignInWithAppleButtonInternal(colorScheme: .dark)
      }
    }
  }
}
fileprivate struct SignInWithAppleButtonInternal: UIViewRepresentable {
  var colorScheme: ColorScheme
  
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    switch colorScheme {
    case .light:
      return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    case .dark:
      return ASAuthorizationAppleIDButton(type: .signIn, style: .white)
    @unknown default:
      return ASAuthorizationAppleIDButton(type: .signIn, style: .black) 
    }
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
struct SignInWithAppleButton_Previews: PreviewProvider {
  static var previews: some View {
    SignInWithAppleButton()
  }
}
