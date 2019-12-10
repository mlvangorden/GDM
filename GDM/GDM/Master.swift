//
//  MainView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/6/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//
import SwiftUI

struct Master: View {
    
    @EnvironmentObject var settings : UserSettings
 
    var body: some View {
        NavigationView {
            Form{
                
                Section{
                    NavigationLink(destination: EnterBGView()) {
                        Text(enterBG)
                    }
                }
                
                Section{
                    NavigationLink(destination: ReportView()) {
                        Text("View Report")
                    }
                }
                
                Section{
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                    }
                }
                
                /*
                Button(action: {
                    //button action
                }) {
                    Text("Enter Blood Glucose")
                        .font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding([.top, .bottom], 8)
                .padding([.trailing, .leading], -20)
                .background(Color.yellow)
                
                Button(action: {
                    //button action
                }) {
                    Text("View Record").font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding([.top, .bottom], 8)
                .padding([.trailing, .leading], -20)
                .background(Color.yellow)
                
                Button(action: {
                    //button action
                }) {
                    Text("Settings").font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding([.top, .bottom], 8)
                .padding([.trailing, .leading], -20)
                .background(Color.yellow)
                
                */
            }

            .navigationBarTitle(Text(title), displayMode: .automatic)
        }
    }
}
