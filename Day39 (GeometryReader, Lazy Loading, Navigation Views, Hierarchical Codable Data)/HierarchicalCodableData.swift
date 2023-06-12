//
//  ContentView.swift
//  Moonshot
//
//  Created by Kyle Sarygin on 6/11/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    let input = """
        {
            "name": "Kanye West",
            "address": {
                "street": "Somewhere in LA",
                "city": "Los Angelessse"
            }
        }
        """
    var body: some View {
        Button("Decode JSON") {
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
