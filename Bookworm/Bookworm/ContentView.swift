//
//  ContentView.swift
//  Bookworm
//
//  Created by Kyle Sarygin on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    // Allows us to access environment managed objects (Write and Save to/from CoreData)
    @Environment(\.managedObjectContext) var moc
    // Allows to Read from CoreData
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            Text("hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
