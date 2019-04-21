//
//  AboutView.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class AboutView: UIViewController {

    @IBOutlet weak var appName: UILabel!
    
	// MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appName.text = Bundle.main.displayName
        self.appName.font = .pacifico
    }

}
