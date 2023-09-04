//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Kyle Sarygin on 7/7/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.image != nil {
                Text("There was an error loading the image")
            } else {
                ProgressView()
            }
        }
        
/*
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
