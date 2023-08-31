//
//  UserDetailView.swift
//  Day 61 Challenge
//
//  Created by Kyle Sarygin on 8/26/23.
//

import SwiftUI

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Friends")) {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
            .navigationTitle(user.name)
        }
    }
}
