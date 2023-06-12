//
//  ContentView.swift
//  Animations
//
//  Created by Kyle Sarygin on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                rotation += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(rotation), axis: (x: 0.5, y: 0.5, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
