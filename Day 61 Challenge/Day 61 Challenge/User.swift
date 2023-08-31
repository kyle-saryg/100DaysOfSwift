//
//  User.swift
//  Day 61 Challenge
//
//  Created by Kyle Sarygin on 8/26/23.
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
    let age: Int
    let registered: String
    let friends: [Friend]
}
