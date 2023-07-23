//
//  ContentView.swift
//  CupcakeCorner Refactored (Challenge Day 52)
//
//  Created by Kyle Sarygin on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    //ONLY place 'order' is created, everyone else shares a this object
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Section {
                    Picker("Select cake type", selection: $order.orderDetails.type) {
                        ForEach(Order.types, id: \.self) { cakeType in
                            Text(cakeType)
                        }
                    }
                    
                    Stepper("Number of Cakes: \(order.orderDetails.quantity)", value: $order.orderDetails.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.orderDetails.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.orderDetails.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Deets")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
