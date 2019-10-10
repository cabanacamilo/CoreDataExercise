//
//  User+CoreDataProperties.swift
//  CoreDataExercise
//
//  Created by Camilo Cabana on 10/10/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32

}
