//
//  ProductCollectionProtocols.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Router

protocol ProductCollectionWireframeProtocol: class {
    func showProductDetail(_ product: Product)
}

// MARK: - Interactor

protocol ProductCollectionInteractorInputProtocol {
    func downloadData()
}

// MARK: - Presenter

protocol ProductCollectionPresenterInputProtocol: class {
    func loadApplication()
    func didSelectRow(_ row: CellController)
}

protocol ProductCollectionInteractorOutputProtocol: class {
    func contentResult(products: [Product])
    func contentResult(error: ApiRequestError)
}

// MARK: - View

protocol ProductCollectionPresenterOutputProtocol: class {
    func setRows(_ rows: [AnyObject])
}
