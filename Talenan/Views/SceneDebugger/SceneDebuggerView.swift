//
//  SceneDebuggerView.swift
//  Talenan
//
//  Created by Ahmad Nabili on 16/06/21.
//

import SwiftUI

struct SceneDebuggerView: View {
    weak var windowParam: UIWindow?
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isEnabled = false
    
    var body: some View {
        let idfr: String = """
        \(isEnabled)
        [UIApplication]
            hash: \(UIApplication.shared.hashValue)
        [Window]
            bounds: \(windowParam?.bounds)
            hash: \(windowParam?.hash ?? 0)
            sceneHash: \(windowParam?.windowScene?.hash ?? 0)
        [KeyWindow - deprecated]
            bounds: \(UIApplication.shared.keyWindow?.bounds)
            hash: \(UIApplication.shared.keyWindow?.hash ?? 0)
            sceneHash: \(UIApplication.shared.keyWindow?.windowScene?.hash ?? 0)
        [windows on windowscene]
            total: \(windowParam?.windowScene?.windows.count ?? -1)
            items: [\(windowParam?.windowScene?.windows.map { "\n        - \(String(describing: type(of: $0))):\($0.hashValue)" }.joined() ?? "-")\n    ]
        [connectedScenes]:
            total: \(UIApplication.shared.connectedScenes.count )
            items: [\(UIApplication.shared.connectedScenes.map { "\n        - \(String(describing: type(of: $0))):\($0.hashValue)-\(String(describing: type(of: $0.delegate)))" }.joined() )\n    ]
        """
        ScrollView {
            Text(idfr)
                .font(.system(size: 14))
                .onReceive(timer) { _ in isEnabled.toggle() }
        }
    }
}

struct SceneDebuggerView_Previews: PreviewProvider {
    static var previews: some View {
        SceneDebuggerView()
    }
}
