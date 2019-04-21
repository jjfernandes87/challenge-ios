//
//  HomePresenter.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class HomePresenter: NSObject {

	// MARK: - Viper Module Properties

    weak var view: HomePresenterOutputProtocol!
    var interactor: HomeInteractorInputProtocol!
    var wireframe: HomeWireframeProtocol!

	// MARK: - Private Methods
    private func loadBanners(_ banner: [Banner]) -> [AnyObject] {
        var rows = [AnyObject]()
        if banner.count > 0 {
            rows.append(BannerCell(banner, delegate: self))
        }
        return rows
    }
    
    private func loadCategory(_ categories: [Category]) -> [AnyObject] {
        var rows = [AnyObject]()
        if categories.count > 0 {
            rows.append(HeaderCell(title: "Categorias"))
            rows.append(CategoryCell(categories, delegate: self))
        }
        return rows
    }
    
    private func loadBestSellers(_ products: [Product]) -> [AnyObject] {
        var rows = [AnyObject]()
        
        if products.count > 0 {
            rows.append(HeaderCell(title: "Mais vendidos"))
            products.forEach { (item) in
                rows.append(ProductCell(item))
                rows.append(EmptyCell(left: 22))
            }
        }
        
        return rows
    }
}

// MARK: - HomePresenterInputProtocol
extension HomePresenter: HomePresenterInputProtocol {
    func loadApplication() {
        self.interactor.downloadData()
    }
    
    func didSelectRow(_ row: CellController) {
        switch row {
        case (is ProductCell): self.wireframe.showProductDetail((row as! ProductCell).product)
        default: break
        }
    }
}

// MARK: - HomeInteractorOutputProtocol
extension HomePresenter: HomeInteractorOutputProtocol {
    func contentResult(banner: [Banner], category: [Category], bestSellers: [Product]) {
        var rows = [AnyObject]()
        rows.append(contentsOf: self.loadBanners(banner))
        rows.append(contentsOf: self.loadCategory(category))
        rows.append(contentsOf: self.loadBestSellers(bestSellers))
        self.view.setRows(rows)
    }
    
    func contentResult(error: ApiRequestError) {
        print(error.message())
        self.view.errorData()
    }
}

// MARK: - BannerCellDelegate
extension HomePresenter: BannerCellDelegate, CategoryCellDelegate {
    func bannerCell(_ banner: Banner) {
        self.wireframe.showExternalLink(banner.linkUrl)
    }
    
    func categoryCell(_ category: Category) {
        self.wireframe.showProductCollection(category)
    }
}
