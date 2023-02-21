import Cocoa

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
book = Book(title: "LOTR", author: "idk")
let author = book?.author?.first?.uppercased() ?? "n/a"

print(author)
