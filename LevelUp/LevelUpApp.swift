//
//  LevelUpApp.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import SwiftUI
import UIKit
import Firebase
import CoreML
import Vision

@main
struct LevelUpApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var delegate
    @StateObject var points : Player = Player()
    @StateObject var chatHelper : ChatHelper = ChatHelper()

    var body: some Scene {
        WindowGroup {
           ContentView()
                .preferredColorScheme(.light)
                .environmentObject(points)
            .environmentObject(chatHelper)

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
class PoseNetManager: PoseNetDelegate {
    func poseNet(_ poseNet: PoseNet, didPredict predictions: PoseNetOutput) {
        let poseBuilder = PoseBuilder(output: predictions, configuration: poseBuilderConfiguration, inputImage: image!)
        for pose in poseBuilder.poses {
            print(pose)
        }
    }
    func observeImage(imageName: String) {
        let image = UIImage(named: imageName)
        if let image = image?.cgImage {
            self.image = image
            posenet.predict(image)
        }
    }
    var posenet: PoseNet!
    var poseBuilderConfiguration = PoseBuilderConfiguration()
    var image: CGImage?
    init() {
        do {
        posenet = try PoseNet()
        }
        catch {
            print(error)
        }
        posenet.delegate = self
    }
}


