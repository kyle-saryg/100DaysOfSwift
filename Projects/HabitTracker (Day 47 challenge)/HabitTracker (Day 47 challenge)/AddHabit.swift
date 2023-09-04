//
//  AddHabit.swift
//  HabitTracker (Day 47 challenge)
//
//  Created by Kyle Sarygin on 6/28/23.
//

import SwiftUI

struct AddHabit: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var occurence = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                Picker("Occurences", selection: $occurence) {
                    ForEach(0...600, id: \.self) { number in
                        Text("\(number)")
                    }
                }
            }
            .toolbar {
                Button("sAvE") {
                    let newObj = Habit(title: title, description: description, occurences: occurence)
                    activities.habits.append(newObj)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(activities: Activities())
    }
}
