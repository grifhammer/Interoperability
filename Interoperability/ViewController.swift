//
//  ViewController.swift
//  Interoperability
//
//  Created by Griffin Hammer on 1/27/16.
//  Copyright © 2016 Griffin Hammer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var items : [ShoppingItem] = [ShoppingItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        reloadTable()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let item = self.items[indexPath.row]
        
        cell.textLabel?.text = "\(item.itemName) - \(item.itemDescription!)"
        
        return cell
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


}

