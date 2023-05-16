//
//  ContentView.swift
//  BetterRest
//
//  Created by Kyle Sarygin on 3/19/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var coffeeAmount = 1
    @State private var sleepAmount = 8.0
    @State private var wakeUpTime = defaultWakeTime
    
    @State private var alertMessage = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("What time do you want to wakeup?") {
                    DatePicker("Enter Time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Enter desired hours of sleep") {
                    
                    Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily Coffee Intake") {
                    Picker("Number of Cups", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            if $0 == 1 {
                                Text("\($0) cup")
                            } else {
                                Text("\($0) cups")
                            }
                        }
                    }
                }
                Text("Bedtime: \(calculateBedtime())")
                    .font(.largeTitle)
            }
        }
    }
    
    func calculateBedtime() -> String{
        do {
            let config = MLModelConfiguration()
            let model = try SleepPredictionModel(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            let wakeUpBy = (components.hour ?? 0 ) * 60 * 60 + (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(wakeUpBy), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUpTime - prediction.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "problem calculating your foofoo ass bedtiem"
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
