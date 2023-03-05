import Cocoa

struct CustomStruct {
    var title: String
    
    func updateTitle(new: String) -> Self {
        return CustomStruct(title: new)
    }
    
    mutating func changeTitle(new: String) {
        title = new
    }
}

var foo = CustomStruct(title: "heheh")
print(foo.title)

print("\n- - - - - - - - - - - - - - - - - - - - -\n")

let bar = foo.updateTitle(new: "boohoo")
print(bar.title)


