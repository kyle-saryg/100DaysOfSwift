//
//  ContentView.swift
//  HabitTracker (Day 47 challenge)
//
//  Created by Kyle Sarygin on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAddHabit = false
    @StateObject var activities = Activities()
    
    var testHab = Habit(title: "Study", description: "Finished day of Swift", occurences: 0)
    var testHab1 = Habit(title: "Work", description: "Ktown", occurences: 0)
    var testHab2 = Habit(title: "Gym", description: "WE GO GYM", occurences: 0)

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.habits) { habit in
                    NavigationLink {
                        DescriptionView(habit: habit)
                    } label: {
                        HStack {
                            Text("\(habit.title)")
                            Spacer()
                            Text("\(habit.occurences)")
                        }
                    }
                }
            }
            .navigationTitle("hAbIt tRacKeR")
            .toolbar {
                Button {
                    isShowingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isShowingAddHabit) {
                AddHabit(activities: activities)
            }
        }
        .task {
            activities.habits.append(testHab)
            activities.habits.append(testHab1)
            activities.habits.append(testHab2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
