//
//  Order.swift
//  CupcakeCorner
//
//  Created by Kyle Sarygin on 7/19/23.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case orderDetails
    }
    
    static let types = ["Vanilly", "Strawy", "Choccy", "Rainbow"]
    
    @Published var orderDetails = OrderDetails()
    
    @Published var specialRequestEnabled = false {
        didSet {
            // Special requests disabled, force other two properties to false
            if specialRequestEnabled == false {
                orderDetails.extraFrosting = false
                orderDetails.addSprinkles = false
            }
        }
    }
    
    // Cannot attach @Published property wrapper to computed properties
    // Used to enable/disable checkout button within 'AddressView.swift'
    var hasValidAddress: Bool {
        
        if orderDetails.name.isEmpty || orderDetails.streetAddress.isEmpty || orderDetails.city.isEmpty || orderDetails.zip.isEmpty {
            return false
        } else if orderDetails.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || orderDetails.streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || orderDetails.city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || orderDetails.zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(orderDetails.quantity) * 2
        
        // Complicated cakes cost more
        // (I guess chocolate is more complex than strawberry, and rainbow is the most complex
        cost += (Double(orderDetails.type) / 2)
        
        // $1 per cake for extra frosting
        if orderDetails.extraFrosting {
            cost += Double(orderDetails.quantity)
        }
        
        // $0.50 per cake for sprinkles
        if orderDetails.addSprinkles {
            cost += Double(orderDetails.quantity) / 2
        }
        
        return cost
    }
    
    // Used when creating first instance (in 'ContentView.swift')
    // Creates an empty order (all properties have defaults or are computed)
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        orderDetails = try container.decode(OrderDetails.self, forKey: .orderDetails)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(orderDetails, forKey: .orderDetails)
    }
}
