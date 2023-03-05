//
//  ContentView.swift
//  CoolDesign
//
//  Created by Kyle Sarygin on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .red], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Text("Some Cool Content")
                .foregroundColor(.primary)
                .padding(50)
                .border(.black)
                .background(.ultraThinMaterial)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
