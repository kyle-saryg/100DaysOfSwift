//
//  ContentView.swift
//  Edutainment
//
//  Created by Kyle Sarygin on 5/24/23.
//

import SwiftUI

/*
 1. Pick multiplication table (2 to 12)
 2. Select number of questions (5, 10, 15, 20)
 3. Questions are randomly generated within selected multiplication table
    - Keep Track of score as well
*/

struct ContentView: View {
    @State private var lowerRange = 2
    @State private var upperRange = 12
    @State private var questionCount = 0
    let questionCountOptions = [5, 10, 15, 20]
    let timesTableOptions = 2...12
    
    var lowerFilteredRange: [Int] {
        return Array(timesTableOptions).filter { $0 <= upperRange }
    }
    
    var upperFilteredRange: [Int] {
        return Array(timesTableOptions).filter { $0 >= lowerRange }
    }
    
    var body: some View {
        List {
            Picker("Lowest times table", selection: $lowerRange) {
                ForEach(lowerFilteredRange, id: \.self) {
                    if lowerRange <= upperRange {
                        Text("\($0)")
                    }
                }
            }
            
            Picker("Highest times table", selection: $upperRange) {
                ForEach(upperFilteredRange, id: \.self) {
                    if upperRange >= lowerRange {
                        Text("\($0)")
                    }
                }
            }
            
            Picker("Number of Questions", selection: $questionCount) {
                ForEach(questionCountOptions, id: \.self) {
                    Text("\($0)")
                }
            }
                   
            Button("Play Game") {
                // Transitions to play game state
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
