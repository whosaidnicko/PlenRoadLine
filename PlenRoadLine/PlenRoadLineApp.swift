//
//  PlenRoadLineApp.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 10/02/2025.
//

import SwiftUI

@main
struct PlenRoadLineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                BeginilVowi()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

func vibr(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
    feedbackGenerator.impactOccurred()
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.movement
    }
    
    static var movement = UIInterfaceOrientationMask.landscape {
        didSet {
            if #available(iOS 16.0, *) {
                UIApplication.shared.connectedScenes.forEach { scene in
                    if let windowScene = scene as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: movement))
                    }
                }
                UIViewController.attemptRotationToDeviceOrientation()
            } else {
                if movement == .landscape {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                } else {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }
            }
        }
    }
}

