//
//  HabitEntry.swift
//  HabitTracker (Day 47 challenge)
//
//  Created by Kyle Sarygin on 6/28/23.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let occurences: Int
}
