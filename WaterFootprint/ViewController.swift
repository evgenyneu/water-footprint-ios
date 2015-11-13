//
//  ViewController.swift
//  WaterFootprint
//
//  Created by Evgenii on 10/11/2015.
//  Copyright © 2015 Evgenii Neumerzhitckii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let textField = searchBar.valueForKey("searchField") as? UITextField {
      textField.textColor = UIColor.whiteColor()
      textField.backgroundColor = UIColor.blackColor()
    }
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
}

