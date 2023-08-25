//
//  UserDetailView.swift
//  Day 60 Challenge
//
//  Created by Kyle Sarygin on 8/25/23.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            VStack {
                List(user.friends) { friend in
                    HStack {
                        Text(friend.name)
                    }
                }
            }
            .navigationTitle(user.name)
        }
    }
}
