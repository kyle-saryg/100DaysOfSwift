//
//  DescriptionView.swift
//  HabitTracker (Day 47 challenge)
//
//  Created by Kyle Sarygin on 7/4/23.
//

import SwiftUI

struct DescriptionView: View {
    let habit: Habit
    
    var body: some View {
        NavigationView {
            Text(habit.description)
            .toolbar {
                Text(habit.title)
                
                Spacer()
                
                Text("\(habit.occurences)")
            }
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static let exampleHabit = Habit(title: "Gym", description: "Workout at 24 like the godly king you are", occurences: 400)
    
    static var previews: some View {
        DescriptionView(habit: exampleHabit)
    }
}
