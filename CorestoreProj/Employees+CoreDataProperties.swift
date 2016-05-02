//
//  Employees+CoreDataProperties.swift
//  
//
//  Created by Faleela on 28/04/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Employees {

    @NSManaged var name: String?
    @NSManaged var designation: String?

}
