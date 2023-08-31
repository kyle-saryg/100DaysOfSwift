//
//  User.swift
//  Day 61 Challenge
//
//  Created by Kyle Sarygin on 8/26/23.
//

import Foundation

struct Users: Codable {
    let users: [User]
}

struct User: Codable, Identifiable {
    struct Friend: Codable, Identifiable {
        let id: String
        let name: String
    }
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}
