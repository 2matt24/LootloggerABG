//
//  ItemsViewController.swift
//  Lootlogger
//
//  Created by Amath Benoit Gaye on 11/7/25.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    

    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
        
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
            
        
        let newItem = itemStore.createItem()
            
            // The book's original implementation:
            // This method of finding the index is often used in the book's context,
            // where the new item is guaranteed to be added at the end.
            
            // Figure out where that item is in the array
            if let index = itemStore.allItems.firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 0)
                
                // 2. Insert this new row into the table view
                // The table view will now see a matching count in the data source
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        
        }
        
    

    @IBAction func toggleEditingMode(_ sender: UIButton) {

        
        // If you are currently in editing mode...
            if isEditing {
                // Change text of button to inform user of state
                sender.setTitle("Edit", for: .normal)
                
                // Turn off editing mode by calling the UIViewController method
                setEditing(false, animated: true)
            } else {
                // Change text of button to inform user of state
                sender.setTitle("Done", for: .normal)
                
                // Enter editing mode by calling the UIViewController method
                setEditing(true, animated: true)
            }
        }
    
        
    
    
    override func tableView(_ tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
         for: indexPath)

        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
        let item = itemStore.allItems[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        return cell
    }
    
    
    // In ItemsViewController.swift (This logic looks correct)
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            // 1. Get the Item to be removed from the store
            let item = itemStore.allItems[indexPath.row]
            
            // 2. Remove the Item from the ItemStore (This requires the method added in step 1)
            itemStore.removeItem(item: item) // ERROR OCCURS HERE
            
            // 3. Remove the corresponding row from the table view (the UI)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }

}
