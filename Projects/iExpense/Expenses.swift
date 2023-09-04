//
//  Expenses.swift
//  iExpense
//
//  Created by Kyle Sarygin on 6/7/23.
//

import Foundation

// Class because app will be syncronized around an Expenses() object (Different views will access Expenses() object)
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // savedItems is an encoded piece of data (of type 'Data')
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
            // Would run go here if an error during decoding occurs
        }
        // No previously saved "Items"
        items = []
        return
    }
}
