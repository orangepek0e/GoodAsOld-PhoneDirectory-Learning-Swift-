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
        print("Button pressed!")
    }
}
