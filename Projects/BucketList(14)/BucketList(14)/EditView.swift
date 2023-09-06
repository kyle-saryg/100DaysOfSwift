//
//  EditView.swift
//  BucketList(14)
//
//  Created by Kyle Sarygin on 9/5/23.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void
    
    @State private var name: String
    @State private var description: String
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Location Name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Location Details")
            .toolbar {
                Button("Save") {
                    // Same coordinates as location being editted, replaced name and description
                    let newLocation = Location(id: UUID(), name: name, description: description, latitude: location.latitude, longitude: location.longitude)
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { _ in }
    }
}

