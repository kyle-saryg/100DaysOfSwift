//
//  ContentView.swift
//  WordScramble
//
//  Created by Kyle Sarygin on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    // Game state variables
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @FocusState private var textFieldFocused: Bool
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    // Capturing user defined word, stored in 'newWord'
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        // Keeps text field in focus
                        .focused($textFieldFocused)
                        .submitLabel(.done)
                        .onSubmit {
                            textFieldFocused = true
                        }
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Score: \(score)")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("New Root Word", action: startGame)
                }
            }
            .navigationBarTitle(rootWord)
        }
        .onAppear(perform: startGame)
        .onSubmit(addNewWord)
        .alert(errorTitle, isPresented: $showingError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
    
    /*
     1. Lower case new word and remove white space/new lines
        - Allows for duplicate removal
     2. Check word has ATLEAST one character (none-empty string)
        - Otherwise exit/return
     3. Insert entered word into beginning of 'usedWords' array (index 0)
     4. Set 'newWord' back to empty string
        - Allowing new word to be entered
    */
    func addNewWord() {
        let processedString = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Word cannot be empty AND cannot have been already used
        guard processedString.count > 2 else {
            newWord = ""
            return
        }
        
        // Doesn't allow for input word to be the same as root word
        guard processedString != rootWord.lowercased() else {
            wordError(title: "No cheating", message: "The word you inputted cannot be the same as the root word")
            return
        }
        
        guard !usedWords.contains(processedString) else {
            wordError(title: "Word alread used", message: "Submit a NEW word")
            return
        }
        
        guard isPossible(word: processedString) else {
            wordError(title: "Cannot create word", message: "You can't spell \(newWord) from the letters of \(rootWord)")
            return
        }
        
        guard isReal(word: processedString) else {
            wordError(title: "Word is not real", message: "\(processedString) doesn't exist within the english dictionary lol")
            return
        }
        
        score += 1
        // Word is new, inserting to beginning of 'usedWords' array
        usedWords.insert(processedString, at: 0)
        // resetting 'newWord'
        newWord = ""
    }
    
    func isPossible(word: String) -> Bool {
        // Stored copy of 'rootWord' as a variable, processing will modify its value
        var tmp = rootWord
        
        // Determining if all the letters within 'rootWord' are present within 'word'
        for letter in word {
            // Finding index of 'letter' within entered 'rootWord' (tmp'
            if let pos = tmp.firstIndex(of: letter) {
                tmp.remove(at: pos)
            } else {
                // Letter within 'word' doesn't exist within 'rootWord'
                return false
            }
        }
        // All letters within 'word' exist within 'rootWord'
        return true
    }
    
    // Checks for typos within submitted word, using UITextChecker
    // Returns true -> Word exists AND is spelled correctly
    // Returns false -> Word doesn't exist within English dictionary OR misspelled
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        // Creating range from first index, to length of word (utf16 encoded [default Swift encoding])
        let range = NSRange(location: 0, length: word.utf16.count)
        // Extracting position of misspelled letters
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        // Returning conditional, evaluated to bool
        // NSNotFound -> Word exists AND is spelled correctly
        return misspelledRange.location == NSNotFound
    }
    
    func startGame() {
        // Empty word pool
        usedWords = []
        // Resetting score
        score = 0
        
        // loading 'start.txt' from bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // converting file to String, String() may throw errors (that's what the 'try?' is for)
            if let startWords = try? String(contentsOf: startWordsURL) {
                // Creating array of words by splitting across newlines
                let allWords = startWords.components(separatedBy: "\n")
                // randomElement() returns an optional, "oop" should never be used
                rootWord = allWords.randomElement() ?? "oop"
                return
            }
        }
        fatalError("Failed to load or locate 'start.txt' from bundle")
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
