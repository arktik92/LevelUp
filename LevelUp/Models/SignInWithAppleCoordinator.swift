//
//  File.swift
//  LevelUp
//
//  Created by esteban semellier on 15/06/2021.
//

import Foundation
import SwiftUI
import AuthenticationServices
import UIKit

enum SignInState: String {
  case signIn
  case link
  case reauth
}
class SignInWithAppleCoordinator: NSObject {
  @LazyInjected private var taskRepository: TaskRepository
  @LazyInjected private var authenticationService: AuthenticationService // (1)
  
  private weak var window: UIWindow!
  private var onSignedIn: ((User) -> Void)? // (2)
  private var currentNonce: String? // (3)
  
  init(window: UIWindow?) {
    self.window = window
  }
    private func appleIDRequest(withState: SignInState) -> ASAuthorizationAppleIDRequest {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest() // (1)
        request.requestedScopes = [.fullName, .email] // (2)
        request.state = withState.rawValue //(3)
        let nonce = randomNonceString() // (4)
        currentNonce = nonce
        request.nonce = sha256(nonce)
        return request
      }
    // more code to follow
}
