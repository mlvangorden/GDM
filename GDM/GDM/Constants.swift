//
//  Constants.swift
//  GDM
//
//  Created by Matthew Van Gorden on 11/13/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//

import Foundation
import SwiftUI

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
    "Other"
]

let title = "GDM" //subject to change!
let enterBG = "Enter Blood Glucose"
let home = "Home"
let disclaimer = "Disclaimer"
let about = "About"
let resources = "Resources"

struct BGReading : Codable {
    var blood_glucose : Int
    var date_time : Date
    var type : String
}
