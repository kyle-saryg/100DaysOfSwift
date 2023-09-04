import Cocoa

var height: Double? = nil

height = 0

check(input: height)

func check(input: Double?) {
    guard let val = input else {
        print("bad value")
        return
    }
    print("good value \(val)")
    return
}

