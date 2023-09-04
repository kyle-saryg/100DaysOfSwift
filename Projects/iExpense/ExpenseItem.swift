//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Kyle Sarygin on 6/7/23.
//

import Foundation

struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
