//
//  ContentView.swift
//  TicTacToeQuizzzer
//
//  Created by Kyle Sarygin on 3/14/23.
//

import SwiftUI

struct ContentView: View {
    
    enum Choices: String, Identifiable, CaseIterable {
        var id: Self {
            self
        }
        case rock = "🗿"
        case paper = "🧻"
        case scissor = "✂️"
    }
    
    let maxTrials = 3
    let secondaryFont = 14
    let primaryFont = 60
    @State var oppChoice: Choices = Choices.allCases.randomElement()!
    @State var wantsWin = Bool.random() //Starts random, then toggles
    @State private var score = 0
    @State private var trials = 0
    var gameOver: Bool {
        trials >= maxTrials
    }
    
    func isWin(opposition: Choices, choice: Choices) -> Bool{
        if opposition == Choices.rock && choice == Choices.paper{
            return true
        } else if opposition == Choices.paper && choice == Choices.scissor{
            return true
        } else if opposition == Choices.scissor && choice == Choices.rock {
            return true
        } else if opposition == choice {
            return false
        }
        return false
    }
    
    func reRoll(opposition: Choices, choice: Choices) {
        if isWin(opposition: oppChoice, choice: choice) && wantsWin{
            score += 1
            trials += 1
        } else if !isWin(opposition: oppChoice, choice: choice) && !wantsWin {
            if oppChoice == choice {
                score -= 1
            trials += 1
            } else {
                score += 1
            trials += 1
            }
        } else {
            score -= 1
            trials += 1
        }
        wantsWin.toggle()
        oppChoice = Choices.allCases.randomElement()!
    }
    
    
    var body: some View {
        VStack {
            Text("SCORE \(score)")
                    .font(.system(size: CGFloat(primaryFont)))
            
            HStack{
                Text("Opponent reveals, ")
                    .font(.system(size: CGFloat(secondaryFont)))
                Text("\(oppChoice.rawValue)")
                    .font(.system(size: CGFloat(primaryFont)))
            }
            
            Text("and you want to")
                .font(.system(size: CGFloat(secondaryFont)))
            
            Text("\(wantsWin ? "✅" : "❌")")
                .font(.system(size: CGFloat(primaryFont)))
            
            Text("Which do you choose?")
                .font(.system(size: CGFloat(secondaryFont)))
            
            Button {
                reRoll(opposition: oppChoice, choice: .rock)
            } label: {
                Text("ROCK")
                    .font(.system(size: CGFloat(primaryFont)))
            }
            .alert(isPresented: .constant(gameOver)) {
                Alert(
                    title: Text("GAME OVER"),
                    message: Text("You Scored: \(score)"),
                    dismissButton: .default(Text("RESTART")) {
                        score = 0
                        trials = 0
                    })
            }
            
            HStack {
                Button {
                    reRoll(opposition: oppChoice, choice: .scissor)
                } label: {
                    Text("Scissor")
                        .font(.system(size: CGFloat(primaryFont)))
                }
                .alert(isPresented: .constant(gameOver)) {
                    Alert(
                        title: Text("GAME OVER"),
                        message: Text("You Scored: \(score)"),
                        dismissButton: .default(Text("RESTART")) {
                            score = 0
                            trials = 0
                        })
                }
                Button {
                    reRoll(opposition: oppChoice, choice: .paper)
                } label: {
                    Text("Paper")
                        .font(.system(size: CGFloat(primaryFont)))
                }
                .alert(isPresented: .constant(gameOver)) {
                    Alert(
                        title: Text("GAME OVER"),
                        message: Text("You Scored: \(score)"),
                        dismissButton: .default(Text("RESTART")) {
                            score = 0
                            trials = 0
                        })
                }
            }
        }
        .frame(width: .infinity)
        .padding()
        .border(.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
