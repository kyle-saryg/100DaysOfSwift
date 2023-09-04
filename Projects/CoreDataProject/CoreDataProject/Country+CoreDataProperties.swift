//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Kyle Sarygin on 8/14/23.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?

    public var wrappedShortName: String {
        shortName ?? "Unkown Country"
    }
    
    public var wrappedfullName: String {
        fullName ?? "Unkown Country"
    }
    
    public var candyArray: [Candy] {
        // Conditional type cast
        let set = candy as? Set<Candy> ?? []
        
        // Sorted method accepts a closure, could also use $0, $1
        return set.sorted { foo, bar in
            foo.wrappedName < bar.wrappedName
        }
    }
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
