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

struct ReportView: View {
    let pink = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    let white = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    let blue = Color(#colorLiteral(red: 0.08355905861, green: 0.413069278, blue: 0.9848034978, alpha: 1))
    
    let abbreviated_types = ["Fst", "Bkf", "1hr-B", "2hr-B", "Lun", "1hr-L", "2hr-L", "Din", "1hr-D", "2hr-D", "Bed", "Nite"]
    
    @State var startDate = Date()
    @State var endDate = Date()
    
    @State var confirmSubmission = false
    
    @EnvironmentObject var settings : UserSettings
    
    var body: some View {
        Form{
            Section {
                DatePicker(
                    selection: $startDate,
                    in: ...self.endDate,
                    displayedComponents: [.date],
                    label: { Text("Start Date") }
                )
                DatePicker(
                    selection: $endDate,
                    in: self.startDate...,
                    displayedComponents: [.date],
                    label: { Text("End Date") }
                )
            }
            Section {
                VStack{
                    Text("Daily Averages")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Spacer()
                        ForEach( 0 ..< Types.count) { i in
                            if(checkOn(type: i, settings: self.settings)){
                                VStack{
                                    Text(self.getAverageReading(type: i, start: Date(), end: self.endDate) != 0 ? String( NSString(format: "%.0f", self.getAverageReading(type: i, start: Date(), end: self.endDate) ) ) : "-")
                                    .font(.system(size: 10))
                                    
                                    ZStack(alignment: .bottom){
                                        Capsule().frame(width: 15, height: 150)
                                            .foregroundColor(self.pink)
                                        Capsule().frame(width: 15, height: min(self.getAverageReading(type: i, start: Date(), end: self.endDate) / 2, 150))
                                            .foregroundColor(self.white)
                                        VStack{
                                            if(self.checkTarget(type:i) > 0) {
                                                Capsule().frame(width: 15, height: 1)
                                                    .foregroundColor(self.blue)
                                            }
                                            Capsule().frame(width: 15, height: min(self.checkTarget(type: i) / 2, 150) )
                                                .hidden()
                                        }
                                    }
                                    
                                    Text(self.abbreviated_types[i])
                                        .font(.system(size: 10))
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 7)
                    .frame(alignment: .center)
                }
            }
            Section {
                Group{
                    HStack{
                        Spacer()
                        Text("Full Report")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack{
                        Text("Date/Time")
                            .font(.headline)
                            .frame(width: 150)
                        Text("BG")
                            .font(.headline)
                            .frame(width: 50)
                        Text("Type")
                            .font(.headline)
                            .frame(width: 150)
                    }
                    ForEach(0 ..< getReadingsRange(start: self.startDate, end: self.endDate).count) { i in
                        if(self.getReadingsRange(start: self.startDate, end: self.endDate).count > i) {
                            HStack{
                                self.formatDate(date: self.getReadingsRange(start: self.startDate, end: self.endDate)[i].date_time)
                                    .frame(width: 150)
                                Text( String(self.getReadingsRange(start: self.startDate, end: self.endDate)[i].blood_glucose) )
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .frame(width: 50)
                                Text( String(self.getReadingsRange(start: self.startDate, end: self.endDate)[i].type) )
                                    .frame(width: 150)
                            }
                        }
                    }
                }
            }
            Section {
                HStack{
                    Spacer()
                    Button(action: {
                            self.confirmSubmission.toggle()
                    }) {
                        Text("Send Report")
                        .frame(alignment: .center)
                    }
                    .disabled(self.settings.doctor_email == "")
                    Spacer()
                }
            }
        }
        .navigationBarTitle(Text(report), displayMode: .automatic)
        .alert(isPresented: $confirmSubmission) {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yy"
            
            var message : String = "\nYou are sending an unsecure\ne-mail to your doctor at:\n\n\(self.settings.doctor_email.lowercased())\n\nwith report from:\n\n\(formatter.string(from: startDate))"
            if(formatter.string(from: startDate) != formatter.string(from: endDate)) {
                message.append(" to \(formatter.string(from: endDate))")
            }
            
            
            return Alert(title: Text("Send Report?"), message: Text(message), primaryButton: .default(Text("Send"), action: {
                //happens when you hit "Submit"
                
                }), secondaryButton: .cancel() )
        }
    }
    
    
    func getAverageReading(type: Int, start: Date, end: Date) -> CGFloat {
        let results = getReadingsRange(type: type, start: start, end: end)
        
        var sum : CGFloat = 0
        for x in results {
            sum += CGFloat(x.blood_glucose)
        }
        if(results.count > 0) {
            sum = sum / CGFloat(results.count)
        }
        
        return sum
    }
    
    func getReadingsRange(type: Int = -1, start: Date, end: Date) -> Array<BGReading> {
        //loads UserDefaults of the user's BGReadings
        var readings = [BGReading]()
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "BGReadings") {
            readings = try! PropertyListDecoder().decode([BGReading].self, from: data)
        }
        
        var results = [BGReading]()
        
        let calendar = Calendar.current
        let start_date = calendar.date(
            bySettingHour: 0,
            minute: 0,
            second: 0,
            of: start)!
        let end_date = calendar.date(
            bySettingHour: 23,
            minute: 59,
            second: 59,
            of: end)!
        
        for x in readings {
            if(type == -1){
                if(x.date_time >= start_date && x.date_time <= end_date) {
                    results.append(x)
                }
            } else if(x.type == Types[type] && x.date_time >= start_date && x.date_time <= end_date) {
                results.append(x)
            }
        }
        
        return results
    }
    
    func getAllReadings() -> Array<BGReading> {
        var readings = [BGReading]()
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "BGReadings") {
            readings = try! PropertyListDecoder().decode([BGReading].self, from: data)
        }
        return readings
    }
    
    func formatDate(date: Date) -> Text {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy, hh:mm a"
        return Text("\(date, formatter: formatter)")
    }
    
    func checkTarget(type: Int) -> CGFloat {
        var retVal : Int?
        
        switch type {
        case 0:
            retVal = Int(settings.fasting_target)
        case 1:
            retVal = Int(settings.before_breakfast_target)
        case 2:
            retVal = Int(settings.after_breakfast1_target)
        case 3:
            retVal = Int(settings.after_breakfast2_target)
        case 4:
            retVal = Int(settings.before_lunch_target)
        case 5:
            retVal = Int(settings.after_lunch1_target)
        case 6:
            retVal = Int(settings.after_lunch2_target)
        case 7:
            retVal = Int(settings.before_dinner_target)
        case 8:
            retVal = Int(settings.after_dinner1_target)
        case 9:
            retVal = Int(settings.after_dinner2_target)
        case 10:
            retVal = Int(settings.bedtime_target)
        case 11:
            retVal = Int(settings.overnight_target)
        default:
            retVal = 0
        }
        
        if(retVal != nil) {
            return CGFloat(retVal!)
        }
        return 0
    }
    
}
