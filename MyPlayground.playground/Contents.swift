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
