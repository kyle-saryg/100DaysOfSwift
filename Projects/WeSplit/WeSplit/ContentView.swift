//
//  ContentView.swift
//  WeSplit
//
//  Created by Kyle Sarygin on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    /*
     Defaults to 2 people, 20% tip (lmao)
     Current Song: Evolution (Excision)
     */
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    @FocusState private var isAmountFocused: Bool
    
    let tipPercentages = [0, 10, 15, 18, 20, 25]
    let partyOptions = Array(0..<100)
    
    //Calculates the bill, INCLUDE tip
    var total: Double {
        checkAmount * (Double(tipPercentage)/100 + 1)
    }
    
    //Calculates split after given total, # of people, and tip percentage
    var totalPerPerson: Double {
        let peopleCount = Double(partyOptions[numberOfPeople])
        let tipSelection = Double(tipPercentage)
        //total with tip added
        let total = (checkAmount * tipSelection/100) + checkAmount
        
        return total / Double(peopleCount)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isAmountFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(partyOptions, id: \.self) {
                            if $0 > 1 {
                                Text("\($0) people")
                           }
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Gratuity:")
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)
                } header: {
                    Text("Gratuity:")
                }
                
                Section {
                    Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Bill Total")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount Per-Person")
                }
                
            }
            .navigationTitle("WeSplit!!! da bill")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done"){
                        isAmountFocused = false
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
