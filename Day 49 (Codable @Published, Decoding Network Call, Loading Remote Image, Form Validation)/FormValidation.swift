//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Kyle Sarygin on 7/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    var disabledform: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating Account")
                }
            }
            .disabled(disabledform)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
