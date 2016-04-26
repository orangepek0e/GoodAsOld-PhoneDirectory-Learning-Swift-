//
//  Orders.swift
//  GoodAsOldPhones [CodeSchoolSwiftApp]
//
//  Created by George Johnston on 2016-04-26.
//  Copyright © 2016 orangepek0e. All rights reserved.
//

import UIKit

//I'm going to utilize 'NSCoding' to write data from my class to the disk.
//note for future self: look up NSCoding on Dash for more information on the two methods below!
class Orders: NSObject, NSCoding {
    var orders: [Order]?
    
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder:NSCoder){
        //your key can be anything, so long as it's unique to this class
        self.orders = aDecoder.decodeObjectForKey("orders") as? [Order]
        
        //note for future self: refer to the docs for more info on init rules
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(orders, forKey: "orders")
    }
    
    //I'm definitely going to need this code again [boilerplate 4 sho]
    class func archiveFilePath() -> String {
        let documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        return documentsDirectory.URLByAppendingPathComponent("cart.archive").path!
    }
    
    //returns an optional orders array to any of our views
    class func readOrdersFromArchive() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(archiveFilePath()) as? [Order]
    }
    
    //updates and saves orders to populate this array, then return a success or fail
    class func saveOrdersToArchive(orders: [Order]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }
}
