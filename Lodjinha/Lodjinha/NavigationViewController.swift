//
//  NavigationViewController.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 20/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = .purple
        self.navigationBar.tintColor = .white
        self.navigationBar.barStyle = .black
    }
    
}
