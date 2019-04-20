//
//  HomeProtocols.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Foundation

// MARK: - Router

protocol HomeWireframeProtocol: class {
    func showExternalLink(_ url: URL)
    func showProductCollection(_ category: Category)
    func showProductDetail(_ product: Product)
}

// MARK: - Interactor

protocol HomeInteractorInputProtocol {
    func downloadData()
}

// MARK: - Presenter

protocol HomePresenterInputProtocol: class {
    func loadApplication()
    func didSelectRow(_ row: CellController)
}

protocol HomeInteractorOutputProtocol: class {
    func contentResult(banner: [Banner], category: [Category], bestSellers: [Product])
    func contentResult(error: ApiRequestError)
}

// MARK: - View

protocol HomePresenterOutputProtocol: class {
    func setRows(_ rows: [AnyObject])
}
