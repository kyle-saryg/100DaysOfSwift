//
//  ContentView.swift
//  Day 60 Challenge
//
//  Created by Kyle Sarygin on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    
    var body: some View {
        VStack {
            Button("testPrint", action: testPrint)
            Button("FetchJSON", action: fetchJSON)
        }
        .padding()
    }
    
    func testPrint() {
        print("TESTINGTESTINGTESTING")
    }
    
    func fetchJSON() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Failed to load JSON")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                print("LINE 35")
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                print("LINE 36")
                DispatchQueue.main.async {
                    print("LINE 38")
                    self.users = decodedResponse.items
                }
            } catch {
                print("Error decoding json")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
