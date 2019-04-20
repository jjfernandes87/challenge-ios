//
//  ProductCollectionInteractor.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ProductCollectionInteractor: NSObject {

	// MARK: - Viper Module Properties
    weak var output: ProductCollectionInteractorOutputProtocol?
    internal let endpoints = EndPoints()
    internal let categoryId: Int
    
    init(_ id: Int) {
        self.categoryId = id
        super.init()
    }
}

// MARK: - ProductCollectionInteractorInputProtocol
extension ProductCollectionInteractor: ProductCollectionInteractorInputProtocol {
    func downloadData() {
        let config = RequestService.request(endpoint: endpoints.product, parameters: ["categoriaId": categoryId])
        ApiService.request(config: config, success: { [weak self] (result) in
            guard let contract = JSONDecoder.decode(ProductCollectionData.self, from: result) else {
                self?.output?.contentResult(error: ApiRequestError.parseObject)
                return
            }
            self?.output?.contentResult(products: contract.data)
        }) { [weak self] (requestError) in
            self?.output?.contentResult(error: requestError)
        }
    }
}
