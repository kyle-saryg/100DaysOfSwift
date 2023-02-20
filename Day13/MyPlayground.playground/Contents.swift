import Cocoa

protocol Building {
    var roomCount: Int { get }
    var cost: Int { get set }
    var agentName: String { get }
    
    func summary() -> String
}

struct House: Building {
    var cost: Int
    let bathroomCount: Int
    let bedRoom: Int
    var roomCount: Int { bathroomCount + bedRoom }
    let agentName: String
    
    func summary() -> String{
        return """
                Cost (Rounded): \(cost)
                Number of Bedrooms: \(bedRoom)
                Number of Bathrooms: \(bathroomCount)
                """
    }
}

struct Office: Building {
    var cost: Int
    var officeRoomsCount: Int
    var roomCount: Int
    let agentName: String
    
    func summary() -> String {
        return """
                Cost (Rounded): \(cost)
                Number of Rooms: \(roomCount)
                Number of Offices: \(officeRoomsCount)
                """
    }
}

let house = House(cost: 500_000, bathroomCount: 3, bedRoom: 5, agentName: "ME NIGGA")
let office = Office(cost: 2_000_000, officeRoomsCount: 350, roomCount: 500, agentName: "SYKE ME AGAIN")

print(house.summary() + "\n")
print(office.summary())
