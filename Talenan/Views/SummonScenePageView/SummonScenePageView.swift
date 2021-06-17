//
//  SummonScenePageView.swift
//  Talenan
//
//  Created by Ahmad Nabili on 13/06/21.
//

import SwiftUI

struct SummonScenePageView: View {
    weak var windowParam: UIWindow?
    let isStandalone: Bool
    
    @State private var textFieldValue: String = ""
    
    var body: some View {
        let mainContent = VStack {
            VStack {
                TextField("Enter any value", text: $textFieldValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 128))]) {
                    RoundCard(title: "Open New Window"){
                        let userActivity = NSUserActivity(
                            activityType: ActivityIdentifier.main.rawValue
                        )
                        UIApplication.shared.requestSceneSessionActivation(
                            nil,
                            userActivity: userActivity,
                            options: nil,
                            errorHandler: nil
                        )
                    }
                    
                    RoundCard(title: "Open New Window (Custom Scene)"){
                        let userActivity = NSUserActivity(activityType: ActivityIdentifier.summonScene.rawValue)
                        UIApplication.shared.requestSceneSessionActivation(nil, userActivity: userActivity, options: nil, errorHandler: nil)
                    }
                    
                    RoundCard(title: "Open New Window (Custom Scene + Pass Value)"){
                        let userActivity = NSUserActivity(
                            activityType: ActivityIdentifier.summonSceneWithData.rawValue
                        )
                        userActivity.userInfo = [ "tfValue" : self.textFieldValue ]
                        UIApplication.shared.requestSceneSessionActivation(
                            nil,
                            userActivity:
                                userActivity,
                            options: nil,
                            errorHandler: nil
                        )
                    }
                    
                    RoundCard(title: "Open New Window Dragable"){}
                        .onDrag({
                            let itemProvider = NSItemProvider()
                            let userActivity = NSUserActivity(activityType: ActivityIdentifier.main.rawValue)
                            itemProvider.registerObject(userActivity, visibility: .all)
                            return itemProvider
                        })
                }.padding()
            }
            Spacer(minLength: 0)
        }
        .navigationTitle("Summon Scene")
        // adding dismiss window/scene button
        .navigationBarItems(leading: Group{
            if self.isStandalone {
                Button(action: {
                    guard let sceneSession = self.windowParam?.windowScene?.session else { return }
                    UIApplication.shared.requestSceneSessionDestruction(sceneSession, options: nil, errorHandler: nil)
                }){
                    Image(systemName: "stop")
                }
            }
        }, trailing: Spacer())
        
        Group {
            if self.isStandalone {
                NavigationView {
                    mainContent
                }
            } else {
                mainContent
            }
        }
    }
}

struct SummonScenePageView_Previews: PreviewProvider {
    static var previews: some View {
        SummonScenePageView(isStandalone: true)
    }
}

struct RoundCard: View {
    let title: String
    let tapAction: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom){
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)
                .opacity(0.3)
            Text(title)
                .foregroundColor(Color.blue)
                .padding()
        }
        .frame(width: 128, height: 180)
        .onTapGesture(perform: tapAction)
    }
}
