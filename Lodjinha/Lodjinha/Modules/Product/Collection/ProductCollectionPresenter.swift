//
//  ProductCollectionPresenter.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ProductCollectionPresenter: NSObject {

	// MARK: - Viper Module Properties

    weak var view: ProductCollectionPresenterOutputProtocol!
    var interactor: ProductCollectionInteractorInputProtocol!
    var wireframe: ProductCollectionWireframeProtocol!

	// MARK: - Private Methods
    private func selectedProduct(_ product: Product) {
        self.wireframe.showProductDetail(product)
    }
}

// MARK: - ProductCollectionPresenterInputProtocol
extension ProductCollectionPresenter: ProductCollectionPresenterInputProtocol {
    func loadApplication() {
        self.interactor.downloadData()
    }
    
    func didSelectRow(_ row: CellController) {
        switch row {
        case (is ProductCell): self.selectedProduct((row as! ProductCell).product)
        default: break
        }
    }
    
}

// MARK: - ProductCollectionInteractorOutputProtocol
extension ProductCollectionPresenter: ProductCollectionInteractorOutputProtocol {
    func contentResult(products: [Product]) {
        var rows = [AnyObject]()
        products.forEach { (item) in
            rows.append(ProductCell(item))
            rows.append(EmptyCell(left: 22))
        }
        self.view.setRows(rows)
    }
    
    func contentResult(error: ApiRequestError) {
        print(error.message())
    }
}
