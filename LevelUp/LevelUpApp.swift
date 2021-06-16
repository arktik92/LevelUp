//
//  LevelUpApp.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import SwiftUI
import UIKit
import Firebase


@main
struct LevelUpApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
