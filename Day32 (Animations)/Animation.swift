//
//  ContentView.swift
//  Animations
//
//  Created by Kyle Sarygin on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var size = 1.0
    
    var body: some View {
        Button("Tap Me") {
            size += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        // Resizing
        .scaleEffect(size)
        // The actual animation
        .animation(.default, value: size)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
