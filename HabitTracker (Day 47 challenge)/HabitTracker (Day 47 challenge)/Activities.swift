//
//  Habits.swift
//  HabitTracker (Day 47 challenge)
//
//  Created by Kyle Sarygin on 6/28/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var habits: [Habit]
    
    init() {
        habits = []
    }
}
