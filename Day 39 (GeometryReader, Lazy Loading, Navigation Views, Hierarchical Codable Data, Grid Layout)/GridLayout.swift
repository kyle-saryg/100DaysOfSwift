//
//  ContentView.swift
//  Moonshot
//
//  Created by Kyle Sarygin on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.adaptive(minimum: 120, maximum: 200))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
