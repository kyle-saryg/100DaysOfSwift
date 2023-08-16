//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Kyle Sarygin on 8/14/23.
//

import CoreData
import SwiftUI

/*
    Needs a Managed Object to work with, and a SwiftUI view to
    display the filtered results (Remember, this struct is a View)
*/
struct FilteredList<T: NSManagedObject, Content: View>: View {
    // Fetch Request provided from ContentView
    // Request is NOT created here, its injected
    @FetchRequest var fetchRequest: FetchedResults<T>
    // Using the generic, 'content' will return a View
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
