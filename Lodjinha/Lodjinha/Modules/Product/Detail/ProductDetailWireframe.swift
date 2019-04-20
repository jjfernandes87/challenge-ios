//
//  ProductDetailWireframe.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 XPInvestimentos. All rights reserved.
//

import UIKit

class ProductDetailWireframe: NSObject, ProductDetailWireframeProtocol {

	// MARK: - Constants
	private let storyBoardName = "Product"
	
	// MARK: - Viper Module Properties
	weak var view: ProductDetailView!

	// MARK: - Constructors

    init(_ id: Int, title: String) {
		super.init()

		let view = self.viewControllerFromStoryboard(ProductDetailView.self, title: title) as! ProductDetailView
        let interactor = ProductDetailInteractor(id)
		let presenter = ProductDetailPresenter()

		presenter.interactor = interactor
		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - ProductDetailWireframeProtocol
    func alert() {
        let alert = UIAlertController(title: "Produto reservado com sucesso", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.view.present(alert, animated: true, completion: nil)
    }
    
	// MARK: - Private methods
	private func viewControllerFromStoryboard<T: UIViewController>(_: T.Type, title: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        viewController.title = title
        
        return viewController
    }

}
