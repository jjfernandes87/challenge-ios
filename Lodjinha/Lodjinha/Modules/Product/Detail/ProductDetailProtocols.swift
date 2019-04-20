//
//  ProductDetailProtocols.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Router

protocol ProductDetailWireframeProtocol: class {
    func alert()
}

// MARK: - Interactor

protocol ProductDetailInteractorInputProtocol {
    func downloadData()
    func sendData()
}

// MARK: - Presenter

protocol ProductDetailPresenterInputProtocol: class {
    func loadApplication()
    func bookAction()
}

protocol ProductDetailInteractorOutputProtocol: class {
    func contentResult(product: Product)
    func contentResult(error: ApiRequestError)
    func sentData()
}

// MARK: - View

protocol ProductDetailPresenterOutputProtocol: class {
    func setRows(_ rows: [AnyObject])
    func enableButton()
}
