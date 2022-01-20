//
//  TabView.swift
//  AI App Prototype
//
//  Created by Chuck Zumbaugh on 3/25/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Breed Date Input", systemImage: "list.dash")
                }
            DueDateInputView()
                .tabItem {
                    Label("Due Date Input", systemImage: "square.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
