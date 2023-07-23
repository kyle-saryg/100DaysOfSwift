//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Kyle Sarygin on 7/19/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.orderDetails.name)
                TextField("Street Address", text: $order.orderDetails.streetAddress)
                TextField("City", text: $order.orderDetails.city)
                TextField("Zip", text: $order.orderDetails.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check Out")
                }
            }
            // Need to throw 'order.hasValidAddress' into the condition '== false'
            // '.hasValidAddress' is computed, and @Published property wrapper cannot be used
            
            // Try throwing an @Published Boolean property then get rid of '== false',
            // It will work as expected
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
