//
//  GettingWindowUIKitView.swift
//  Talenan
//
//  Created by Ahmad Nabili on 13/06/21.
//

import SwiftUI

struct GettingWindowUIKitWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> GettingWindowUIKitViewController {
        GettingWindowUIKitViewController()
    }
    
    func updateUIViewController(_ uiViewController: GettingWindowUIKitViewController, context: Context) {}
}

struct GettingWindowUIKitView: View {
    var body: some View {
        GettingWindowUIKitWrapper()
            .navigationBarTitle("Dummy", displayMode: .inline)
    }
}

struct GettingWindowUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        GettingWindowUIKitView()
    }
}
