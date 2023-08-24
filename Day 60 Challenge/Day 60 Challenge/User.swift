//
//  User.swift
//  Day 60 Challenge
//
//  Created by Kyle Sarygin on 8/22/23.
//

import Foundation

struct User: Codable, Identifiable {
    struct Friend: Codable, Identifiable {
        let id: String
        let name: String
    }
    
    let id: String
    let isActive: Bool
    let name: String
//    let age: Int
//    let company: String
//    let email: String
//    let address: String
//    let about: String
//    let registered: String
//    let tags: [String]
    let friends: [Friend]
}
