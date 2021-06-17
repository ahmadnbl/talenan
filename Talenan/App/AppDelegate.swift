//
//  AppDelegate.swift
//  Talenan
//
//  Created by Ahmad Nabili on 13/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        var currentActivity: ActivityIdentifier
        var userInfo = [String:Any]()
        
        if
            let activity = options.userActivities.first,
            let activityIdentifier = ActivityIdentifier(rawValue: activity.activityType)
        {
            currentActivity = activityIdentifier
            activity.userInfo?.forEach { key, value in
                guard let keyString = key as? String else { return }
                userInfo[keyString] = value
            }
        } else {
            currentActivity = .main
        }
        
        let sceneConfig = currentActivity.sceneConfiguration()
        
        if connectingSceneSession.userInfo == nil {
            connectingSceneSession.userInfo = [:]
        }
        
        connectingSceneSession.userInfo?["type"] = currentActivity.rawValue
        userInfo.forEach { key, value in connectingSceneSession.userInfo?[key] = value }
        
        return sceneConfig
        
        // return UISceneConfiguration(name: "Summon Scene Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

