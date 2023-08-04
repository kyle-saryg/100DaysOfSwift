//
//  ContentView.swift
//  Bookworm
//
//  Created by Kyle Sarygin on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title), // Primarily sort by title
        SortDescriptor(\.author) // Secondary sort by author (if two books have the same title)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unkown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unkown Author")
                                    .foregroundColor(.secondary)
                            }
                            
                            Text(getDate(book: book))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .listRowBackground(book.rating == 1 ? Color.red : nil)
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("BookWorm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func getDate(book: Book) -> String {
        if let date = book.date {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: date)
        } else {
            return("N/A")
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // Find book at given index, then delete
            let book = books[offset]
            moc.delete(book)
        }
        // Save changes to CoreData
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
