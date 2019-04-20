//
//  HomeWireframe.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class HomeWireframe: NSObject {
    
    // MARK: - Constants
	private let storyBoardName = "Home"
	
	// MARK: - Viper Module Properties
	weak var view: HomeView!

	// MARK: - Constructors
	override init() {
		super.init()

		let view = self.viewControllerFromStoryboard(HomeView.self, title: "a Lodjinha") as! HomeView
        view.navigationItem.titleView = UIImageView(image: UIImage(named: "logoNavbar"))
        let interactor = HomeInteractor()
		let presenter = HomePresenter()

		presenter.interactor = interactor
		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
	}

	// MARK: - Private methods
	private func viewControllerFromStoryboard<T: UIViewController>(_: T.Type, title: String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        viewController.title = title
        
        return viewController
    }

}

// MARK: - HomeWireframeProtocol
extension HomeWireframe: HomeWireframeProtocol {
    func showExternalLink(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }
    
    func showProductCollection(_ category: Category) {
        guard let view = ProductCollectionWireframe(category.id, title: category.category).view else { return }
        self.view.navigationController?.pushViewController(view, animated: true)
    }
    
    func showProductDetail(_ product: Product) {
        guard let view = ProductDetailWireframe(product.id, title: product.name).view else { return }
        self.view.navigationController?.pushViewController(view, animated: true)
    }
}
