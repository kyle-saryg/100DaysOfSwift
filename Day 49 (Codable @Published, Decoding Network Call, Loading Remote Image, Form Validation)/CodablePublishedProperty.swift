//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Kyle Sarygin on 7/7/23.
//

import SwiftUI

class User: ObservableObject, Codable {
    //Key(s) used for encoding/decoding
    enum CodingKeys: CodingKey {
        case name
    }
    
    //Observable property
    @Published var name = "Kyle CS"
    
    //Can use 'required init' or 'final class'
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decoding a string, using key '.name'
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //Encoding the property 'name' into key '.name'
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
