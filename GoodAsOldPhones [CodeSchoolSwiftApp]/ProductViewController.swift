//
//  ProductViewController.swift
//  GoodAsOldPhones [CodeSchoolSwiftApp]
//
//  Created by George Johnston on 2016-04-25.
//  Copyright © 2016 orangepek0e. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage{
                productImageView.image = UIImage(named: i)
            }
        }
    }

    @IBAction func addToCartPressed(sender: AnyObject) {
        guard let product = product, let name = product.name, let price = product.price else{
            return
        }
        
        //create an order
        //save this order to list
        
        let alertController = UIAlertController(title: "Added to Cart", message: "You added \(name) to the cart and it costs: $\(price)!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
}

