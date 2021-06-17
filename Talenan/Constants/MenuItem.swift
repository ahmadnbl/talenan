//
//  MenuItem.swift
//  Talenan
//
//  Created by Ahmad Nabili on 13/06/21.
//

import SwiftUI

enum MenuItem: String, Identifiable, CaseIterable {
    case summonScene = "Summoning New Scene"
    case debugScene = "Scene Debugger"
//    case gettingWindow = "Getting Window Instance"
    case gettingTopVcUiKit = "Getting Top View Controller (UIKit)"
//    case getWidthSize = "Getting Width Size"
    
    var id: Int { hashValue }
    
    @ViewBuilder func getTargetView(window: UIWindow?) -> some View {
        switch self {
        case .summonScene:
            SummonScenePageView(isStandalone: false)
        case .debugScene:
            SceneDebuggerView(windowParam: window)
//        case .gettingWindow:
//            GettingWindowPageView(windowParam: window)
        case .gettingTopVcUiKit:
            GettingWindowUIKitView()
//        case .getWidthSize:
//            Text("")
        }
    }
}
