//
//  ContentView.swift
//  iExpense
//
//  Created by Kyle Sarygin on 6/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var ctr = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Row") {
                    numbers.append(ctr)
                    ctr += 1
                }
            }
            .navigationTitle("Deleting rows example")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(offset: IndexSet) {
        numbers.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
