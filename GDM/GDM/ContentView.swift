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
    @EnvironmentObject var settings : UserSettings
    
    init() {
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.9566669365, green: 0.3328225162, blue: 0.7921386133, alpha: 1)
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
