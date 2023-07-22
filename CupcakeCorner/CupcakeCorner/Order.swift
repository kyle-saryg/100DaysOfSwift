//
//  Order.swift
//  CupcakeCorner
//
//  Created by Kyle Sarygin on 7/19/23.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSpringkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilly", "Strawy", "Choccy", "Rainbow"]
    
    // VERY BAD IDEA, to use type as index IF working with mutable array (immutable in this case)
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            // Special requests disabled, force other two properties to false
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    // Cannot attach @Published property wrapper to computed properties
    // Used to enable/disable checkout button within 'AddressView.swift'
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // Complicated cakes cost more
        // (I guess chocolate is more complex than strawberry, and rainbow is the most complex
        cost += (Double(type) / 2)
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50 per cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    // Used when creating first instance (in 'ContentView.swift')
    // Creates an empty order (all properties have defaults or are computed)
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSpringkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(city, forKey: .city)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(zip, forKey: .zip
        )
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSpringkles)
        
        name = try container.decode(String.self, forKey: .name)
        city = try container.decode(String.self, forKey: .city)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        zip = try container.decode(String.self, forKey: .zip)
    }
}
