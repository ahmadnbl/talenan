//
//  ActivityIdentifier.swift
//  Talenan
//
//  Created by Ahmad Nabili on 13/06/21.
//

import UIKit

enum ActivityIdentifier: String {
    case main = "com.nabeel-test.Talenan.main"
    case summonScene = "com.nabeel-test.Talenan.summonScene"
    case summonSceneWithData = "com.nabeel-test.Talenan.summonSceneWithData"
    
    func sceneConfiguration() -> UISceneConfiguration {
        switch self {
        case .main:
            return UISceneConfiguration(
                name: SceneConfigurationNames.standard,
                sessionRole: .windowApplication
            )
        case .summonScene:
            return UISceneConfiguration(
                name: SceneConfigurationNames.summonScene,
                sessionRole: .windowApplication
            )
        case .summonSceneWithData:
            return UISceneConfiguration(
                name: SceneConfigurationNames.summonSceneWithData,
                sessionRole: .windowApplication
            )
        }
    }
}

