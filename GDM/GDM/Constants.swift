//
//  Constants.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/13/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

let Types = [   "Fasting",
    "Before Breakfast",
    "1 hour after Breakfast",
    "2 hours after Breakfast",
    "Before Lunch",
    "1 hour after Lunch",
    "2 hours after Lunch",
    "Before Dinner",
    "1 hour after Dinner",
    "2 hours after Dinner",
    "Bedtime",
    "Overnight",
]

let title = "GDM" //subject to change!
let enterBG = "Enter Blood Glucose"
let report = "View Report"
let home = "Home"
let disclaimer = "Disclaimer"
let about = "About"
let resources = "Resources"
let settings_title = "Settings"

struct BGReading : Codable {
    var blood_glucose : Int
    var date_time : Date
    var type : String
}

func checkOn(type: Int, settings: UserSettings) -> Bool {
    var retVal : Bool
    
    switch type {
    case 0:
        retVal = settings.fasting_on
    case 1:
        retVal = settings.before_breakfast_on
    case 2:
        retVal = settings.after_breakfast1_on
    case 3:
        retVal = settings.after_breakfast2_on
    case 4:
        retVal = settings.before_lunch_on
    case 5:
        retVal = settings.after_lunch1_on
    case 6:
        retVal = settings.after_lunch2_on
    case 7:
        retVal = settings.before_dinner_on
    case 8:
        retVal = settings.after_dinner1_on
    case 9:
        retVal = settings.after_dinner2_on
    case 10:
        retVal = settings.bedtime_on
    case 11:
        retVal = settings.overnight_on
    default:
        retVal = false
    }
    
    return retVal
}

final class KeyboardResponder: ObservableObject {
    let didChange = PassthroughSubject<CGFloat, Never>()
    private var _center: NotificationCenter
    private(set) var currentHeight: CGFloat = 0 {
        didSet {
            didChange.send(currentHeight)
        }
    }

    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        _center.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}

//these two are for keyboard stuff, might delete later
struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }

                return AnyView(Color.clear)
            }
        }
    }
}

final class KeyboardGuardian: ObservableObject {
    public var rects: Array<CGRect>
    public var keyboardRect: CGRect = CGRect()

    // keyboardWillShow notification may be posted repeatedly,
    // this flag makes sure we only act once per keyboard appearance
    public var keyboardIsHidden = true

    @Published var slide: CGFloat = 0

    var showField: Int = 0 {
        didSet {
            updateSlide()
        }
    }

    init(textFieldCount: Int) {
        self.rects = Array<CGRect>(repeating: CGRect(), count: textFieldCount)

    }

    func addObserver() {
NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
}

func removeObserver() {
 NotificationCenter.default.removeObserver(self)
}

    deinit {
        NotificationCenter.default.removeObserver(self)
    }



    @objc func keyBoardWillShow(notification: Notification) {
        if keyboardIsHidden {
            keyboardIsHidden = false
            if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
                keyboardRect = rect
                updateSlide()
            }
        }
    }

    @objc func keyBoardDidHide(notification: Notification) {
        keyboardIsHidden = true
        updateSlide()
    }

    func updateSlide() {
        if keyboardIsHidden {
            slide = 0
        } else {
            //let tfRect = self.rects[self.showField]
            //let diff = keyboardRect.minY - tfRect.maxY
            
            if(self.showField >= 4){
                slide = -1 * keyboardRect.height
                
            }
            /*
            print("---")
            print(keyboardRect.minY)
            print(tfRect.maxY)
            print(diff)
            print("---")
            
            if diff < 0 {
                slide += (diff)
                print(slide)
                print("-1-")
            } else {
                slide += min(diff, 0)
                print(slide)
                print("-2-")
            }
 */

        }
    }
}
