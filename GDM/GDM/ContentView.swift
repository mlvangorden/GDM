//
//  ContentView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/4/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemPink
    }
 
    var body: some View {
        TabView(selection: $selection) {
            Master().tabItem({
                    VStack {
                        Image(home)
                        Text("GDM")
                    }
                })
                .tag(0)
            
            DisclaimerView().tabItem({
                VStack {
                    Image(disclaimer)
                    Text(disclaimer)
                }
            })
            .tag(1)
            
            AboutView().tabItem({
                VStack {
                    Image(about)
                    Text(about)
                }
            })
            .tag(2)
            
            ResourcesView().tabItem({
                VStack {
                    Image(resources)
                    Text(resources)
                }
            })
            .tag(3)
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
