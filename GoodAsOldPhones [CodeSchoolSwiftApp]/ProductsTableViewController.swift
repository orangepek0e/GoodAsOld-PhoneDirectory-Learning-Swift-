//
//  ProductsTableViewController.swift
//  GoodAsOldPhones [CodeSchoolSwiftApp]
//
//  Created by George Johnston on 2016-04-26.
//  Copyright © 2016 orangepek0e. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    //create an array of product names
    var products: [Product]?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"
        
        products = [product1, product2, product3, product4]
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        //the number that is returned in this function, determines the number of rows in the table
        //if you enter: return 5, our table should have 5 rows
        
        //verify that productNames exists, and sets the # of rows equal to the # of product names in our array
        if let p = products {
            return p.count
        }
        //if it cannot find any productNames, return 0
        return 0
    }
    
    //this function will run once for each of the cells created in the previous function
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //looks at the storyboard for any cells that contain the 'reuse identifier' specified, and the creates a cell.
     let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        
        //the indexPath.row property attached to each table cell, gives us a numerical indicator for which object in the array, we're on.
     let product = products?[indexPath.row]
        
     if let p = product{
        cell.textLabel?.text = p.name
        if let i = p.cellImage{
            cell.imageView?.image = UIImage(named: i)
        }
        
     }
        
     return cell
        
    }
    
    //this function is going to pass data between two ViewControllers, upon a segue.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProduct"{
            //next, we try and capture the view controller that we're heading to.
            let productVC = segue.destinationViewController as? ProductViewController
            
            //using guard, we can clean up our multiple if let statements by using commas
            //first, it checks if these values exist, and then sets them to the 'cell' and 'indexPath' variables
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPathForCell(cell)
                else {
                    //stops the function
                    return
            }
            //now I can safely reference the 'indexPath' variable now.
            productVC?.product = products?[indexPath.row]
        }
    }
    
}
