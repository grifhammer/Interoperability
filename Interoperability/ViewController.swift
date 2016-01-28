//
//  ViewController.swift
//  Interoperability
//
//  Created by Griffin Hammer on 1/27/16.
//  Copyright © 2016 Griffin Hammer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var items : [ShoppingItem] = [ShoppingItem]()
    
    @IBAction func populateButtonTouched(sender: AnyObject) {
        DataManager.sharedManager().populate()
        reloadTable()
    }
    
    
    
    @IBAction func searchButtonTouched(sender: AnyObject) {
        DataManager.sharedManager().getShoppingItemWithName(self.searchTextField.text, completed: { (returnedItems: [ShoppingItem]!, error: NSError!) in Void()
                self.items = returnedItems
                self.tableView.reloadData()
            })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchTextField.delegate = self
        reloadTable()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let item = self.items[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("shoppingItemCellReuseID") as? ShoppingItemTableViewCell {
            cell.quantityLabel.text = "\(item.quantity!)"
            cell.itemNameLabel.text = item.itemName!
            cell.categoryLabel.text = "\(item.category!)"
            return cell
        }
        return ShoppingItemTableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func reloadTable() {
        DataManager.sharedManager().getShoppingListWithCompletionBlock( { [weak self] items, error -> Void in
            
            if items != nil {
                if let shoppingItems = items as? [ShoppingItem] {
                    self?.items = shoppingItems
                    
                    self?.tableView.reloadData()
                }
            }
        })
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var txtAfterUpdate:NSString = self.searchTextField.text! as NSString
        txtAfterUpdate = txtAfterUpdate.stringByReplacingCharactersInRange(range, withString: string)
        if(txtAfterUpdate == ""){
            reloadTable()
        }
        DataManager.sharedManager().getShoppingItemWithName(txtAfterUpdate as String, completed:{ (returnedItems, error) -> Void in
            self.items = returnedItems
            self.tableView.reloadData()
        }
        )
        return true
    }


}

