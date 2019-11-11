//
//  MainView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/6/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//
import SwiftUI

struct AboutView : View {
 
    var body: some View {
        NavigationView {
            VStack(spacing: 75){
                Text("About")
                .font(.title)
            }
            .navigationBarTitle(Text("About"), displayMode: .inline)
        }
    }
}
