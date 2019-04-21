//
//  ProductCollectionInteractor.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

typealias content = ((_ products: [Product], _ nextPage: Int) -> Void)

class ProductCollectionInteractor: NSObject {

	// MARK: - Viper Module Properties
    weak var output: ProductCollectionInteractorOutputProtocol?
    internal let endpoints = EndPoints()
    internal let categoryId: Int
    internal let limit = 20
    
    init(_ id: Int) {
        self.categoryId = id
        super.init()
    }
    
    // MARK: - Private methods
    private func donwload(currentPage: Int, completion: @escaping content) {
        let parameters = ["categoriaId": categoryId, "limit": limit, "offset": currentPage]
        let config = RequestService.request(endpoint: endpoints.product, parameters: parameters)
        ApiService.request(config: config, success: { [weak self] (result) in
            guard let contract = JSONDecoder.decode(ProductCollectionData.self, from: result) else {
                self?.output?.contentResult(error: ApiRequestError.parseObject)
                return
            }
            
            let newPage = contract.data.count == self?.limit ? contract.data.last?.id ?? 0 : currentPage
            completion(contract.data, newPage)
            
        }) { [weak self] (requestError) in
            self?.output?.contentResult(error: requestError)
        }
    }
}

// MARK: - ProductCollectionInteractorInputProtocol
extension ProductCollectionInteractor: ProductCollectionInteractorInputProtocol {
    func downloadData(currentPage: Int) {
        self.donwload(currentPage: currentPage) { [weak self] (data, newPage) in
            self?.output?.contentResult(products: data, nextPage: newPage)
        }
    }
    
    func moreData(currentPage: Int) {
        self.donwload(currentPage: currentPage) { [weak self] (data, newPage) in
            self?.output?.moreContentResult(products: data, nextPage: newPage)
        }
    }
}
