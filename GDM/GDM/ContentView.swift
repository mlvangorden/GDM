//
//  ContentView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/4/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemPink
    }
 
    var body: some View {
        TabView(selection: $selection){
            Text("GDM")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("GDM")
                    }
                }
                .tag(0)
            Text("Disclaimer")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Disclaimer")
                    }
                }
                .tag(1)
            Text("About")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("About")
                    }
                }
                .tag(2)
            Text("Resources")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Resources")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
