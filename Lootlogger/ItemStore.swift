//
//  ItemStore.swift
//  Lootlogger
//
//  Created by Amath Benoit Gaye on 11/7/25.
//

import UIKit

class ItemStore {

    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)

        allItems.append(newItem)

        return newItem
        
        
    }
    
    func removeItem(item: Item) {
        // Check if the item exists in the array
        if let index = allItems.firstIndex(of: item) {
            // Remove it from the allItems array
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }

        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]

        // Remove item from array
        allItems.remove(at: fromIndex)

        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    

}
