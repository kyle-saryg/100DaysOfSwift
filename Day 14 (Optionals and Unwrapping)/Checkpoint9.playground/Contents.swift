import Cocoa

func randInt(_ arr: [Int]?) -> Int {
    return arr?.randomElement() ?? Array(1...100).randomElement()!
}

print(randInt(nil))
