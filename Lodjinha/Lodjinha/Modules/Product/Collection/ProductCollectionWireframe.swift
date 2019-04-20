//
//  ProductCollectionWireframe.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 XPInvestimentos. All rights reserved.
//

import UIKit

class ProductCollectionWireframe: NSObject, ProductCollectionWireframeProtocol {

	// MARK: - Constants
	private let storyBoardName = "Product"
	
	// MARK: - Viper Module Properties
	weak var view: ProductCollectionView!

	// MARK: - Constructors

    init(_ id: Int, title: String) {
		super.init()

		let view = self.viewControllerFromStoryboard(ProductCollectionView.self, title: title) as! ProductCollectionView
        let interactor = ProductCollectionInteractor(id)
		let presenter = ProductCollectionPresenter()

		presenter.interactor = interactor
		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

    // MARK: - ProductCollectionWireframeProtocol
    func showProductDetail(_ product: Product) {
        guard let view = ProductDetailWireframe(product.id, title: product.name).view else { return }
        self.view.navigationController?.pushViewController(view, animated: true)
    }

	// MARK: - Private methods
	private func viewControllerFromStoryboard<T: UIViewController>(_: T.Type, title: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        viewController.title = title
        
        return viewController
    }

}
