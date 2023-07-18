//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Kyle Sarygin on 7/7/23.
//

import SwiftUI

struct Response: Codable {
    var results : [Results]
}

struct Results: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Results]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task { // Used for (NETWORK CALLS) actions that may put app to sleep (something that may take a long period of time to run/load/complete)
            await loadData()
        }
    }
    
    func loadData() async {
        // URL is hard coded, will not fail, if it does, you're a dumbass and need to enter it correctly
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            // URLSession.shared -> Default URLSession, no custom configuration
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
