//
//  ContentView.swift
//  BucketList(14)
//
//  Created by Kyle Sarygin on 9/3/23.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    // Function is called "<" allows for conformance to Comparable
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Kyle", lastName: "Sarygin"),
        User(firstName: "Megan", lastName: "Sarygin"),
        User(firstName: "Jacob", lastName: "Do"),
        User(firstName: "Jasmin", lastName: "Pelesasa"),
        User(firstName: "Matthew", lastName: "Nguyen")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
