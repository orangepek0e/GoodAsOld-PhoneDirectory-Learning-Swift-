//
//  ContactViewController.swift
//  GoodAsOldPhones [CodeSchoolSwiftApp]
//
//  Created by George Johnston on 2016-04-25.
//  Copyright © 2016 orangepek0e. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // connect the scrollView to the main view controller
        //note that 'Subview' is all one word

        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //set the height and width for how far the scroll is allowed to go.
        
        scrollView.contentSize = CGSizeMake(375, 800)
    }

}
