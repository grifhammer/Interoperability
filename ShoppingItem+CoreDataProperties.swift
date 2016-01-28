//
//  ShoppingItem+CoreDataProperties.swift
//  Interoperability
//
//  Created by Griffin Hammer on 1/27/16.
//  Copyright © 2016 Griffin Hammer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ShoppingItem {

    @NSManaged var category: String?
    @NSManaged var itemDescription: String?
    @NSManaged var itemName: String?
    @NSManaged var price: NSNumber?
    @NSManaged var quantity: NSNumber?

}
