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
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)){
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(user.isActive ? Color(.systemGreen): Color(.systemRed))
                        Text(user.name)
                        Spacer()
                        Text(formatISO8601Date(iso8601Date:user.registered, outputFormat:"dd/MM/yyyy"))
                    }
                }
            }
            .onAppear(perform: fetchUserData)
        }
    }
    
    func formatISO8601Date(iso8601Date: String, outputFormat: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        
        if let date = isoFormatter.date(from: iso8601Date) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = outputFormat
            return dateFormatter.string(from: date)
            
        } else {
            return "Invalid"
        }
    }
    
    func fetchUserData() {
        // User array is already populated, no need to download
        if !users.isEmpty {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Error retrieving URL")
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // error will be nil if successfull
            if let error = error {
                // if let -> enters code block if non-nil value
                fatalError("Error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                // guard let -> enters code block if nil value
                // redundant code, shouldn't enter this code block since if any errors are present
                // should be handled above
                print("Data fetch error, \(error?.localizedDescription ?? "Unkown Error line 33")")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                users = try decoder.decode([User].self, from: data)
                return
            } catch {
                print("Decoding Error: \(error)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
