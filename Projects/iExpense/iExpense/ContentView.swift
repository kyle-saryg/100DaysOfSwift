//
//  ContentView.swift
//  iExpense
//
//  Created by Kyle Sarygin on 6/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var isShowingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items.reversed()) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            
                            switch item.amount {
                            case let amount where amount <= 10:
                                Text(item.name)
                                    .font(.headline)
                            case let amount where amount <= 100:
                                Text(item.name)
                                    .font(.title)
                            default:
                                Text(item.name)
                                    .font(.largeTitle)
                            }
                            
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    isShowingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isShowingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
