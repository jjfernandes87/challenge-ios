//
//  ProductDetailPresenter.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ProductDetailPresenter: NSObject {
    
	// MARK: - Viper Module Properties
    weak var view: ProductDetailPresenterOutputProtocol!
    var interactor: ProductDetailInteractorInputProtocol!
    var wireframe: ProductDetailWireframeProtocol!

	// MARK: - Private Methods

}

// MARK: - ProductDetailPresenterInputProtocol
extension ProductDetailPresenter: ProductDetailPresenterInputProtocol {
    func loadApplication() {
        self.interactor.downloadData()
    }
    
    func bookAction() {
        self.interactor.sendData()
    }
}

// MARK: - ProductDetailInteractorOutputProtocol
extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
    func contentResult(product: Product) {
        var rows = [AnyObject]()
        rows.append(IconCell(product))
        rows.append(TitleCell(product))
        rows.append(EmptyCell())
        rows.append(PriceCell(product))
        rows.append(EmptyCell())
        rows.append(DetailCell(product))
        self.view.setRows(rows)
    }
    
    func contentResult(error: ApiRequestError) {
        print(error.message())
        self.view.enableButton()
    }
    
    func sentData() {
        self.wireframe.alert()
        self.view.enableButton()
    }
}
