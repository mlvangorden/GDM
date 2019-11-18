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


// this whole thing needs to be restructured, currently just a copy of EnterBGView
struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var settings = UserSettings()
    
    @State var bgText : String = ""
    @State var selectedDate = Date()
    @State var selectedType = -1
    @State var confirmSubmission = false
 
    var body: some View {
        Form{
            Group{
                HStack{
                        Toggle(Types[0], isOn: $settings.fasting_on)
                        TextField("95", text: $settings.fasting_target)
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
                        .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[1], isOn: $settings.before_breakfast_on)
                    TextField("", text: $settings.before_breakfast_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[2], isOn: $settings.after_breakfast1_on)
                    TextField("140", text: $settings.after_breakfast1_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[3], isOn: $settings.after_breakfast2_on)
                    TextField("120", text: $settings.after_breakfast2_target)
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
                    .labelsHidden()
                }
                
            }
            Group {
                
                HStack{
                    Toggle(Types[4], isOn: $settings.before_lunch_on)
                    TextField("", text: $settings.before_lunch_target)
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
                    .labelsHidden()
                }
            
                HStack{
                    Toggle(Types[5], isOn: $settings.after_lunch1_on)
                    TextField("140", text: $settings.after_lunch1_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[6], isOn: $settings.after_lunch2_on)
                    TextField("120", text: $settings.after_lunch2_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[7], isOn: $settings.before_dinner_on)
                    TextField("", text: $settings.before_dinner_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[8], isOn: $settings.after_dinner1_on)
                    TextField("140", text: $settings.after_dinner1_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[9], isOn: $settings.after_dinner2_on)
                    TextField("120", text: $settings.after_dinner2_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[10], isOn: $settings.bedtime_on)
                    TextField("", text: $settings.bedtime_target)
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
                    .labelsHidden()
                }
                
                HStack{
                    Toggle(Types[11], isOn: $settings.overnight_on)
                    TextField("", text: $settings.overnight_target)
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
                    .labelsHidden()
                }
            }
        }
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



