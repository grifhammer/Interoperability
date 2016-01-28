//
//  DataManager+Additions.swift
//  Interoperability
//
//  Created by Griffin Hammer on 1/27/16.
//  Copyright © 2016 Griffin Hammer. All rights reserved.
//

import Foundation


extension DataManager {
    func populate() {
        DataManager.sharedManager().createNewItemWithName("Milk", description: "Gallon of whole milk", category: "Dairy", price: 2.99)
        DataManager.sharedManager().createNewItemWithName("Bread", description: "A loaf of whole wheat bread", category: "Grains", price: 4.50)
        DataManager.sharedManager().createNewItemWithName("Orange Juice", description: "A gallon of orange juice", category: "Juice", price: 5)
        DataManager.sharedManager().createNewItemWithName("Yogurt", description: "5 individual Greek Yogurts", category: "Dairy", price: 1.50)
        DataManager.sharedManager().createNewItemWithName("Mighty Meat", description: "Some Meat to make you nice and strong", category: "Meat", price: 1.50)
    }
}