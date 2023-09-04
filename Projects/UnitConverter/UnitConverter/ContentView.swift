//
//  ContentView.swift
//  UnitConverter
//
//  Created by Kyle Sarygin on 2/26/23.
//

import SwiftUI

struct ContentView: View {
    
    enum Units: String, CaseIterable, Identifiable {
        
        var id: Self {
            return self
        }
        
        case meters = "meters"
        case kilometers = "kilometers"
        case feet = "feet"
        case yards = "yards"
        case miles = "miles"
    }
    
    @State private var inputUnit: Units = .meters
    @State private var outputUnit: Units = .meters
    @State private var distance: Double = 0.0
    @FocusState private var isKeyboardFocused: Bool
    var outputDistance: Double {
        //Convert units to meters first, then convert to desired output unit
        var inputInMeters: Double
        
        //'inputUnit' is of enum type 'Units'
        switch inputUnit {
        case .meters:
            inputInMeters = distance
        case .kilometers:
            inputInMeters = distance * 1_000
        case .feet:
            inputInMeters = distance * 0.3048
        case .yards:
            inputInMeters = distance * 0.9144
        case .miles:
            inputInMeters = distance * 1609.34
        }
        
        switch outputUnit {
        case .meters:
            return inputInMeters
        case .kilometers:
            return inputInMeters / 1000
        case .feet:
            return inputInMeters / 0.3048
        case .yards:
            return inputInMeters / 0.9144
        case .miles:
            return inputInMeters / 1609.34
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            Form {
                //Picking first unit, segmented picker
                Section {
                    Picker("Unit In", selection: $inputUnit) {
                        ForEach(Units.allCases) {
                            Text($0.rawValue)
                        }
                    }
                    //Text field input distance
                    TextField("Distance:", value: $distance, format: .number)
                } header: {
                    Text("Input Unit and Distance")
                }
                .pickerStyle(.segmented)
                .keyboardType(.decimalPad)
                .focused($isKeyboardFocused)
                
                //Picking second unit, segmented picker
                Section {
                    Picker("Unit Out", selection: $outputUnit) {
                        ForEach(Units.allCases) {
                            Text($0.rawValue)
                        }
                        
                    }
                    //Text box for converted distance
                    Text("\(outputDistance, specifier: "%.5f")")
                } header: {
                    Text("Output Unit and Distance")
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Distance Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isKeyboardFocused = false
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
