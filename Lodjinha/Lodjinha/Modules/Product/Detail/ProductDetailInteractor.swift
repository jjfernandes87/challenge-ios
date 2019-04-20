//
//  ProductDetailInteractor.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ProductDetailInteractor: NSObject {
    
    // MARK: - Viper Module Properties
    weak var output: ProductDetailInteractorOutputProtocol?
    internal let endpoints = EndPoints()
    internal let productId: Int
    
    init(_ id: Int) {
        self.productId = id
        super.init()
    }
}

// MARK: - ProductCollectionInteractorInputProtocol
extension ProductDetailInteractor: ProductDetailInteractorInputProtocol {
    func downloadData() {
        let config = RequestService.requestURLReplacements(endpoint: endpoints.productDetail, replacements: ["id": "\(productId)"])
        ApiService.request(config: config, success: { [weak self] (result) in
            guard let contract = JSONDecoder.decode(Product.self, from: result) else {
                self?.output?.contentResult(error: ApiRequestError.parseObject)
                return
            }
            self?.output?.contentResult(product: contract)
        }) { [weak self] (requestError) in
            self?.output?.contentResult(error: requestError)
        }
    }
    
    func sendData() {
        let config = RequestService.requestURLReplacements(endpoint: endpoints.productDetail, replacements: ["id": "\(productId)"])
        ApiService.request(config: config, success: { [weak self] (result) in
            self?.output?.sentData()
        }) { [weak self] (requestError) in
            self?.output?.contentResult(error: requestError)
        }
    }
}
