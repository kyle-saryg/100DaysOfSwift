//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Kyle Sarygin on 8/14/23.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String {
        firstName ?? "Unkown"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unkown"
    }
}

extension Singer : Identifiable {

}
