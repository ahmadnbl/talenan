//
//  SummonSceneWithDataDelegate.swift
//  Talenan
//
//  Created by Ahmad Nabili on 17/06/21.
//

import SwiftUI
import UIKit

class SummonSceneWithDataDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            var newTfValue = "-"
            if let tfValue = session.userInfo?["tfValue"] as? String {
                newTfValue = tfValue
            }
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = UIHostingController(rootView: PreviewSummonedPageView(windowParam: window, data: newTfValue))
            window?.makeKeyAndVisible()
        }
    }
}
