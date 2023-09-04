//
//  OrderDetails.swift
//  CupcakeCorner Refactored (Challenge Day 52)
//
//  Created by Kyle Sarygin on 7/23/23.
//

import Foundation

struct OrderDetails: Codable {
    // VERY BAD IDEA, to use type as index IF working with mutable array (immutable in this case)
    var type = 0
    var quantity = 3
    
    var extraFrosting = false
    var addSprinkles = false
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}
