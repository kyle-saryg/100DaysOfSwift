//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kyle Sarygin on 2/28/23.
//

import SwiftUI
//            LinearGradient(colors: [.blue, .red], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var trials = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    //Three flags displayed, 'correctAnswer' randomly picks one
    @State private var correctAnswer = Int.random(in: 0..<3)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.teal, .yellow], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("\(trials)/5")
                    Text("Touch the flag of ")
                        .foregroundColor(.black)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.black)
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 30)
                    }
                }
                Text("Score: \(score)")
                    .foregroundColor(.black)
                    .font(.largeTitle)
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            alertMsg()
        }
    }
    
    func alertMsg() -> some View {
        if trials == 5 {
            let tmp = score
            score = 0
            trials = 0
            return Text("you scored \(tmp)/5")
            
        }
        return Text("Your schore is \(score)")
    }
    
    func flagTapped(_ number: Int) {
        if trials == 5 {
            scoreTitle = "Game Over"
        } else if number == correctAnswer {
            scoreTitle = "NICE JOB"
            score += 1
        } else {
            scoreTitle = "try again lol thats actuall \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
        
        //Only running the game 5 times before resetting score
        trials += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
