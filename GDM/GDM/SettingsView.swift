//
//  EnterBGView.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/6/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//
import SwiftUI
import Foundation
import Combine

struct SettingsView: View {
    
    @ObservedObject var kGuardian = KeyboardGuardian(textFieldCount: 12)
    
    @ObservedObject var keyboard = KeyboardResponder()
    @EnvironmentObject var settings : UserSettings
    
    @State var bgText : String = ""
    @State var selectedDate = Date()
    @State var selectedType = -1
    @State var confirmSubmission = false
 
    var body: some View {
        Form{
            Section{
                HStack{
                    Text("Doctor's E-Mail")
                    
                    TextField("example@gmail.com", text: $settings.doctor_email)
                    .keyboardType(.emailAddress)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
 
                }
            }
            Section{
                Text("BG Targets")
                .font(.title)
                
                /*
                ForEach(0...Types.count, id: \.self){ i in
                    HStack{
                        //Toggle(Types[i], isOn: self.$settings.on_array[i])
                        //.labelsHidden()
                        Text(Types[i])
                        TextField(self.target_samples[i], text: self.$settings.target_array[i], onEditingChanged: { if $0 { self.kGuardian.showField = i } })
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
                        .disabled(!self.settings.on_array[i])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: self.$kGuardian.rects[i]))
                    }
                    
                }
 */
                Group {
                    HStack{
                        Toggle(Types[0], isOn: $settings.fasting_on)
                        .labelsHidden()
                        Text(Types[0])
                        TextField("95", text: $settings.fasting_target, onEditingChanged: { if $0 { self.kGuardian.showField = 0 } })
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
                        .disabled(!self.settings.fasting_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[0]))
                    }
                }
                Group {
                    HStack{
                        Toggle(Types[1], isOn: $settings.before_breakfast_on)
                        .labelsHidden()
                        Text(Types[1])
                        TextField("", text: $settings.before_breakfast_target, onEditingChanged: { if $0 { self.kGuardian.showField = 1 } })
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
                        .disabled(!self.settings.before_breakfast_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[1]))
                    }
                }
                Group {
                    
                    HStack{
                        Toggle(Types[2], isOn: $settings.after_breakfast1_on)
                        .labelsHidden()
                        Text(Types[2])
                        TextField("140", text: $settings.after_breakfast1_target, onEditingChanged: { if $0 { self.kGuardian.showField = 2 } })
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
                        .disabled(!self.settings.after_breakfast1_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[2]))
                    }
                    
                    HStack{
                        Toggle(Types[3], isOn: $settings.after_breakfast2_on)
                        .labelsHidden()
                        Text(Types[3])
                        TextField("120", text: $settings.after_breakfast2_target, onEditingChanged: { if $0 { self.kGuardian.showField = 3 } })
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
                        .disabled(!self.settings.after_breakfast2_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[3]))
                    }
                    
                    HStack{
                        Toggle(Types[4], isOn: $settings.before_lunch_on)
                        .labelsHidden()
                        Text(Types[4])
                        TextField("", text: $settings.before_lunch_target, onEditingChanged: { if $0 { self.kGuardian.showField = 4 } })
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
                        .disabled(!self.settings.before_lunch_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[4]))
                    }
                 
                    HStack{
                        Toggle(Types[5], isOn: $settings.after_lunch1_on)
                        .labelsHidden()
                        Text(Types[5])
                        TextField("140", text: $settings.after_lunch1_target, onEditingChanged: { if $0 { self.kGuardian.showField = 5 } })
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
                        .disabled(!self.settings.after_lunch1_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[5]))
                    }
                    
                    HStack{
                        Toggle(Types[6], isOn: $settings.after_lunch2_on)
                        .labelsHidden()
                        Text(Types[6])
                        TextField("120", text: $settings.after_lunch2_target, onEditingChanged: { if $0 { self.kGuardian.showField = 6 } })
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
                        .disabled(!self.settings.after_lunch2_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[6]))
                    }
                    
                    HStack{
                        Toggle(Types[7], isOn: $settings.before_dinner_on)
                        .labelsHidden()
                        Text(Types[7])
                        TextField("", text: $settings.before_dinner_target, onEditingChanged: { if $0 { self.kGuardian.showField = 7 } })
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
                        .disabled(!self.settings.before_dinner_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[7]))
                    }
                    
                    HStack{
                        Toggle(Types[8], isOn: $settings.after_dinner1_on)
                        .labelsHidden()
                        Text(Types[8])
                        TextField("140", text: $settings.after_dinner1_target, onEditingChanged: { if $0 { self.kGuardian.showField = 8 } })
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
                        .disabled(!self.settings.after_dinner1_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[8]))
                    }
                    
                    HStack{
                        Toggle(Types[9], isOn: $settings.after_dinner2_on)
                        .labelsHidden()
                        Text(Types[9])
                        TextField("120", text: $settings.after_dinner2_target, onEditingChanged: { if $0 { self.kGuardian.showField = 9 } })
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
                        .disabled(!self.settings.after_dinner2_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[9]))
                    }
                    
                    HStack{
                        Toggle(Types[10], isOn: $settings.bedtime_on)
                        .labelsHidden()
                        Text(Types[10])
                        TextField("", text: $settings.bedtime_target, onEditingChanged: { if $0 { self.kGuardian.showField = 10 } })
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
                        .disabled(!self.settings.bedtime_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[10]))
                    }
                    
                    HStack{
                        Toggle(Types[11], isOn: $settings.overnight_on)
                        .labelsHidden()
                        Text(Types[11])
                        TextField("", text: $settings.overnight_target, onEditingChanged: { if $0 { self.kGuardian.showField = 11 } })
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
                        .disabled(!self.settings.overnight_on)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(GeometryGetter(rect: $kGuardian.rects[11]))
                    }
     
                }
            }
        }
        .navigationBarTitle(Text(settings_title), displayMode: .automatic)
        .offset(y: kGuardian.slide).animation(.easeInOut(duration: 0.5))
        .onAppear { self.kGuardian.addObserver() }
        .onDisappear { self.kGuardian.removeObserver() }
    }
}


@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class UserSettings: ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault("doctor_email", defaultValue: "")
    var doctor_email: String {
        willSet {
            objectWillChange.send()
        }
    }

    @UserDefault("fasting_on", defaultValue: false)
    var fasting_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("before_breakfast_on", defaultValue: false)
    var before_breakfast_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_breakfast1_on", defaultValue: false)
    var after_breakfast1_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_breakfast2_on", defaultValue: false)
    var after_breakfast2_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("before_lunch_on", defaultValue: false)
    var before_lunch_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_lunch1_on", defaultValue: false)
    var after_lunch1_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_lunch2_on", defaultValue: false)
    var after_lunch2_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("before_dinner_on", defaultValue: false)
    var before_dinner_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_dinner1_on", defaultValue: false)
    var after_dinner1_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_dinner2_on", defaultValue: false)
    var after_dinner2_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("bedtime_on", defaultValue: false)
    var bedtime_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("overnight_on", defaultValue: false)
    var overnight_on: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    @UserDefault("fasting_target", defaultValue: "")
    var fasting_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("before_breakfast_target", defaultValue: "")
    var before_breakfast_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_breakfast1_target", defaultValue: "")
    var after_breakfast1_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_breakfast2_target", defaultValue: "")
    var after_breakfast2_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("before_lunch_target", defaultValue: "")
    var before_lunch_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_lunch1_target", defaultValue: "")
    var after_lunch1_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_lunch2_target", defaultValue: "")
    var after_lunch2_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("before_dinner_target", defaultValue: "")
    var before_dinner_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_dinner1_target", defaultValue: "")
    var after_dinner1_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("after_dinner2_target", defaultValue: "")
    var after_dinner2_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("bedtime_target", defaultValue: "")
    var bedtime_target: String {
        willSet {
            objectWillChange.send()
        }
    }
    @UserDefault("overnight_target", defaultValue: "")
    var overnight_target: String {
        willSet {
            objectWillChange.send()
        }
    }
}



