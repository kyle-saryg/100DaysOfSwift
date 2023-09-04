//
//  ContentView.swift
//  WordScramble
//
//  Created by Kyle Sarygin on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hellow Waldo")
            .padding()
    }
    
    func test() {
        // Example word
        let word = "swift"
        // Creating text spelling checker object
        let checker = UITextChecker()
        
        // Specifying range (starting at first index, to end)
        // UTF16 is native string encoding within Swift, .count -> number of letters within 'word'
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        // allGood = true if no spelling error found
        // allGood = false if spelling error was found
        let allGood = mispelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
