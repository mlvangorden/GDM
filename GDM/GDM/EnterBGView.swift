//
//  EnterBGView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/6/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//
import SwiftUI

struct EnterBGView: View {
    
    @State var selectedDate = Date()

    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return min...max
    }
    
    @State var bgText : String
    var bgInt : Int
 
    var body: some View {
        VStack{
            Text("Enter BG")
            TextField("mg/dL", text: $bgText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
            .onTapGesture {
                   let keyWindow = UIApplication.shared.connectedScenes
                                      .filter({$0.activationState == .foregroundActive})
                                      .map({$0 as? UIWindowScene})
                                      .compactMap({$0})
                                      .first?.windows
                                      .filter({$0.isKeyWindow}).first
                   keyWindow!.endEditing(true)
            }
            
            Text("Date / Time")
            DatePicker(
                selection: $selectedDate,
                in: dateClosedRange,
                displayedComponents: [.hourAndMinute, .date],
                label: { Text("") }
            )
        }
    }
}
