//
//  ContentView.swift
//  iExpense
//
//  Created by Kyle Sarygin on 6/1/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Kyool"
    @Published var lastName = "Sarygin"
}

struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name: ", text: $user.firstName)
            TextField("Last Name: ", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
