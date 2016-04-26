//
//  CartTableViewController.swift
//  GoodAsOldPhones [CodeSchoolSwiftApp]
//
//  Created by George Johnston on 2016-04-26.
//  Copyright © 2016 orangepek0e. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var ordersInCart: [Order]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = headerView
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let product = Product()
        
        product.name = "1907 Wall Set"
        product.productImage = "phone-fullscreen1"
        product.cellImage = "image-cell1"
        product.price = 59.99
        
        let order = Order()
        order.product = product
        
        //read orders from disk
        
        ordersInCart = [order]
        
        updateTotal()
        
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //this nil-coalescing operator will simplify the code written in our other numberOfRows... function
        return ordersInCart?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)
        
        let order = ordersInCart?[indexPath.row]
        
        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
            updateTotal()
        }

//         ! == force

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // because we know our enum, you don't need to rewrite the dataType.  Xcode has type inference [ie: UITableViewCellEditingStyle.Delete can be written as .Delete]
        if editingStyle == .Delete {
//             Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            //save array to disk
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            updateTotal()
        }
    }
    
    //update the price total at the top of the cart screen
    func updateTotal() -> Void{
        if let orders = ordersInCart{
            var total: Double = 0.0
            for order in orders{
                if let price = order.product?.price{
                    total = total + price
                }
            }
            totalLabel.text = String(total)
        }
    }
    
}
