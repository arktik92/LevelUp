//
//  SignInApple.swift
//  LevelUp
//
//  Created by esteban semellier on 16/06/2021.
//

import SwiftUI
import AuthenticationServices

struct SignInApple: View {
    @StateObject var loginData = LoginModel()
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            loginData.nonce = randomNonceString()
            request.requestedScopes = [.email, .fullName]
            request.nonce = sha256(loginData.nonce)
        } onCompletion: { result in
            switch result {
            case .success(let user):
                print("succes")
                guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                    print("error with firebase")
                    return
                }
                loginData.authenticate(credential: credential)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }.signInWithAppleButtonStyle(.white)
        .frame(width: 300, height: 50, alignment: .center)
        .clipShape(Capsule())
    }
}
