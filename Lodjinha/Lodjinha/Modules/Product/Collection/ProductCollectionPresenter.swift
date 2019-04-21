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
    
    internal var lastId = 0
    internal var loadingNextPage = false
    
	// MARK: - Private Methods
    private func selectedProduct(_ product: Product) {
        self.wireframe.showProductDetail(product)
    }
    
    private func nextPage() {
        if loadingNextPage == false {
            loadingNextPage = true
            self.interactor.moreData(currentPage: lastId)
        }
    }
    
    private func loadCells(products: [Product], nextPage: Int) -> [AnyObject] {
        var rows = [AnyObject]()
        products.forEach { (item) in
            rows.append(EmptyCell(left: 22))
            rows.append(ProductCell(item))
        }
        
        if nextPage != self.lastId {
            self.lastId = nextPage
            rows.append(LoadingCell())
        }
        
        return rows
    }
    
    func enableNextPage() {
        self.loadingNextPage = false
    }
}

// MARK: - ProductCollectionPresenterInputProtocol
extension ProductCollectionPresenter: ProductCollectionPresenterInputProtocol {
    func loadApplication() {
        self.interactor.downloadData(currentPage: lastId)
    }
    
    func didSelectRow(_ row: CellController) {
        switch row {
        case (is ProductCell): self.selectedProduct((row as! ProductCell).product)
        default: break
        }
    }
    
    func willDisplay(_ cell: CellController) {
        switch cell {
        case (is LoadingCell): self.nextPage()
        default: break
        }
    }
}

// MARK: - ProductCollectionInteractorOutputProtocol
extension ProductCollectionPresenter: ProductCollectionInteractorOutputProtocol {
    func contentResult(products: [Product], nextPage: Int) {
        self.view.setRows(loadCells(products: products, nextPage: nextPage))
    }
    
    func moreContentResult(products: [Product], nextPage: Int) {
        self.view.appendRows(loadCells(products: products, nextPage: nextPage))
    }
    
    func contentResult(error: ApiRequestError) {
        print(error.message())
        self.view.errorData()
    }
}
