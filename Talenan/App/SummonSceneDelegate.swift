//
//  SummonSceneDelegate.swift
//  Talenan
//
//  Created by Ahmad Nabili on 17/06/21.
//

import SwiftUI
import UIKit

class SummonSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = UIHostingController(rootView: SummonScenePageView(windowParam: window, isStandalone: true))
            window?.makeKeyAndVisible()
        }
    }
}
