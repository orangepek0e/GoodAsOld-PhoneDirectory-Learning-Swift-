//
//  Order.swift
//  GoodAsOldPhones [CodeSchoolSwiftApp]
//
//  Created by George Johnston on 2016-04-26.
//  Copyright © 2016 orangepek0e. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    var product: Product?
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder:NSCoder){
        self.product = aDecoder.decodeObjectForKey("product") as? Product
        

        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(product, forKey: "product")
    }
}
