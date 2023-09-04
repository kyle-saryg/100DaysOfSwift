import Cocoa

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String{
    if id < 0 {
        throw UserError.networkFailed
    }
    
    return "GODLY USER"
}

//user is scoped local to 'if' statement
if let user = try? getUser(id: 0) {
    print("User1 -> \(user)")
}

let user2 = (try? getUser(id: -1)) ?? "brok"
print("user2 -> \(user2)")
