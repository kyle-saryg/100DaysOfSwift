//
//  ContentView.swift
//  WordScramble
//
//  Created by Kyle Sarygin on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    let people = ["Kyle", "Tyler", "Matt", "Jacob", "Trin"]
    
    var body: some View {
        List {
            Text("Static Row -> Start")
            
            ForEach(people, id: \.self) {
                Text("Dynamic Row -> \($0)")
            }
            
            Text("Static Row -> End")
        }
    }
    
    func loadfile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // Loaded the file into 'fileContents' as a string
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
