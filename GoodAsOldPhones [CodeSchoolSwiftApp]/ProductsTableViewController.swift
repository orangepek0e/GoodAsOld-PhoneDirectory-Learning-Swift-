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
    var productNames: [String]?
    
    
    
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
            productVC?.productName = productNames?[indexPath.row]
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        //the number that is returned in this function, determines the number of rows in the table
        //if you enter: return 5, our table should have 5 rows
        
        //verify that productNames exists, and sets the # of rows equal to the # of product names in our array
        if let pNames = productNames {
            return pNames.count
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
     let productName = productNames?[indexPath.row]
        
     if let pName = productName{
        cell.textLabel?.text = pName
     }
        
     cell.imageView?.image = UIImage(named: "image-cell1")
        
     return cell
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
            
        productNames = ["1907 Wall Set", "1921 Dial Phone", "1937 Desk Set", "1984 Motorola Portable"]
        
    }
    
}
