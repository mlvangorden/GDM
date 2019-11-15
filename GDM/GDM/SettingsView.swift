//
//  EnterBGView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/6/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//
import SwiftUI


// this whole thing needs to be restructured, currently just a copy of EnterBGView
struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var bgText : String = ""
    @State var selectedDate = Date()
    @State var selectedType = -1
    @State var confirmSubmission = false
 
    var body: some View {
        Form {
            HStack{
                Text("Setting1")
                TextField("mg/dL", text: $bgText)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .onTapGesture {
                       let keyWindow = UIApplication.shared.connectedScenes
                                          .filter({$0.activationState == .foregroundActive})
                                          .map({$0 as? UIWindowScene})
                                          .compactMap({$0})
                                          .first?.windows
                                          .filter({$0.isKeyWindow}).first
                       keyWindow!.endEditing(true)
                }
            }
            
            Button(action: {
                    self.confirmSubmission.toggle()
            }) {
                Text("Submit")
            }
            .disabled(false)
        }
        .navigationBarTitle(Text(enterBG), displayMode: .automatic)
        .alert(isPresented: $confirmSubmission) {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yy, hh:mm a"
            let submission = BGReading(blood_glucose: Int(self.bgText)!, date_time: self.selectedDate, type: Types[self.selectedType])
            
            //loads UserDefaults of the user's BGReadings
            var readings = [BGReading]()
            let defaults = UserDefaults.standard
            if let data = defaults.data(forKey: "Settings") {
                readings = try! PropertyListDecoder().decode([BGReading].self, from: data)
            }
            
            return Alert(title: Text("Submit Blood Glucose?"), message: Text("\(submission.blood_glucose) mg/dL\n\(submission.date_time, formatter: formatter)\n\(submission.type)"), primaryButton: .default(Text("Submit"), action: {
                //happens when you hit "Submit"
                
                readings.append(submission) //adds the current submission into all the readings
                readings.sort { (bg1: BGReading, bg2: BGReading) -> Bool in
                    return bg1.date_time > bg2.date_time
                }
                //stores the sorted array back into UserDefaults
                UserDefaults.standard.set(try? PropertyListEncoder().encode(readings), forKey: "Settings")
                
                self.presentationMode.wrappedValue.dismiss() //pops current view
                }), secondaryButton: .cancel() )
        }
    }
}
