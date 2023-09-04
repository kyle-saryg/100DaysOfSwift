//
//  ContentView.swift
//  Moonshot
//
//  Created by Kyle Sarygin on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("New View #\(row)")
                } label: {
                    Text("Hello World")
                }
                .navigationTitle("SwiftUI")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
