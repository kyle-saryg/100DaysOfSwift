//
//  Results.swift
//  BucketList(14)
//
//  Created by Kyle Sarygin on 9/6/23.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        // Attempt to read terms
        // Attempt to read 'description' key
        // If any of them fail error string is stored
        terms?["description"]?.first ?? "No further information"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
