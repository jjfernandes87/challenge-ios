//
//  AboutWireframe.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class AboutWireframe: NSObject, AboutWireframeProtocol {

	// MARK: - Constants
	private let storyBoardName = "About"
	
	// MARK: - Viper Module Properties
	weak var view: AboutView!

	// MARK: - Constructors

	override init() {
		super.init()

        let view = self.viewControllerFromStoryboard(AboutView.self, title: "Sobre") as! AboutView
		let interactor = AboutInteractor()
		let presenter = AboutPresenter()

		presenter.interactor = interactor
		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

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
