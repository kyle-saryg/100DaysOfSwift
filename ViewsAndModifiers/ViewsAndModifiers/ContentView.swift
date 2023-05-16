//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Kyle Sarygin on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .background(.teal)
            .padding()
            .background(.blue)
            .padding()
            .background(.yellow)
            .padding()
            .background(.red)
            .padding()
            .background(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
