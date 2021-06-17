//
//  ContentView.swift
//  Talenan
//
//  Created by Ahmad Nabili on 13/06/21.
//

import SwiftUI

struct ContentView: View {
    weak var windowParam: UIWindow?
    
    var body: some View {
        NavigationView {
            List(MenuItem.allCases) { menuItem in
                NavigationLink(destination: menuItem.getTargetView(window: self.windowParam)){
                    Text(menuItem.rawValue)
                }
            }
            .navigationBarTitle("доска!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
