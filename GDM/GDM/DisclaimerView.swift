//
//  MainView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/6/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//
import SwiftUI

struct DisclaimerView: View {
 
    var body: some View {
        NavigationView {
            VStack(spacing: 75){
                Text("Disclaimer")
                .font(.title)
            }
            .navigationBarTitle(Text("Disclaimer"), displayMode: .inline)
        }
    }
}
