//
//  EnterBGView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/6/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//
import SwiftUI

struct EnterBGView: View {
    
    @State var BGText : String
    @State var selectedDate = Date()
 
    var body: some View {
        
        TextField("Enter BG", text: $BGText)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.numberPad)

        
        //DatePicker($selectedDate, displayedComponents: .date)
            
        }
    }

