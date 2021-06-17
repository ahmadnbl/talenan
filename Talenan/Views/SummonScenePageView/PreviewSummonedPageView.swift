//
//  PreviewSummonedPageView.swift
//  Talenan
//
//  Created by Ahmad Nabili on 17/06/21.
//

import SwiftUI

struct PreviewSummonedPageView: View {
    weak var windowParam: UIWindow?
    let data: String
    
    var body: some View {
        NavigationView {
            Text(data)
                // adding dismiss window/scene button
                .navigationBarItems(leading: Group{
                    Button(action: {
                        guard let sceneSession = self.windowParam?.windowScene?.session else { return }
                        UIApplication.shared.requestSceneSessionDestruction(sceneSession, options: nil, errorHandler: nil)
                    }){
                        Image(systemName: "stop")
                    }
                }, trailing: Spacer())
        }
    }
}

struct PreviewSummonedPageView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewSummonedPageView(data: "sss")
    }
}
