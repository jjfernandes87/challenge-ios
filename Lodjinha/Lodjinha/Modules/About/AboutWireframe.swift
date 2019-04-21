//
//  AboutWireframe.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class AboutWireframe: NSObject {

	// MARK: - Constants
	private let storyBoardName = "About"
	
	// MARK: - Viper Module Properties
	weak var view: AboutView!

	// MARK: - Constructors

	override init() {
		super.init()
        let view = self.viewControllerFromStoryboard(AboutView.self, title: "Sobre") as! AboutView
		self.view = view
	}

    // MARK: - AboutWireframeProtocol

	// MARK: - Private methods
	private func viewControllerFromStoryboard<T: UIViewController>(_: T.Type, title: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        viewController.title = title
        
        return viewController
    }

}
