//
//  Location.swift
//  BucketList(14)
//
//  Created by Kyle Sarygin on 9/4/23.
//

import Foundation
import CoreLocation

// Equatable vs Comparable
// Equatable -> is equal or is not equal
// Comparable -> Sorting based on < or >
struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    // Cannot store CLLocationCoordinate2D directly in the struct (will break Equatable)
    // Created on the fly when needed, as a computed property (not directly stored within the struct)
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // Example data
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where the Queen resides", latitude: 51.501, longitude: -0.141)
    
    // Manual creation of function ran when == operand is used
    // Faster than Swift checking for equivalence of each property (speed optimization)
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
