//
//  ContentView.swift
//  WaterMarkModifier
//
//  Created by Kyle Sarygin on 3/11/23.
//

import SwiftUI

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func waterMarked(with text: String) -> some View{
        modifier(WaterMark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
/*        Color.mint
            .frame(width: 300, height: 300)
            .border(.black)
            .waterMarked(with: "Kyle Coolio Sarygin, Editorial: 1955")
 */
        Text("Hello World")
            .frame(width: 300, height: 300)
            .background(.mint)
            .border(.red)
            .waterMarked(with: "Kyle S. thought \"This is pretty cool\" ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
