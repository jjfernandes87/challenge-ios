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
    func downloadData(currentPage: Int)
    func moreData(currentPage: Int)
}

// MARK: - Presenter

protocol ProductCollectionPresenterInputProtocol: class {
    func loadApplication()
    func enableNextPage()
    func didSelectRow(_ row: CellController)
    func willDisplay(_ cell: CellController)
}

protocol ProductCollectionInteractorOutputProtocol: class {
    func contentResult(products: [Product], nextPage: Int)
    func moreContentResult(products: [Product], nextPage: Int)
    func contentResult(error: ApiRequestError)
}

// MARK: - View

protocol ProductCollectionPresenterOutputProtocol: class {
    func setRows(_ rows: [AnyObject])
    func appendRows(_ rows: [AnyObject])
}
