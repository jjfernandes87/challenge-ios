//
//  HomeInteractor.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class HomeInteractor: NSObject {

	// MARK: - Viper Module Properties
    weak var output: HomeInteractorOutputProtocol?
    internal let endpoints = EndPoints()
    
    var banners: [Banner]?
    var categories: [Category]?
    var products: [Product]?
    var error: ApiRequestError?
    
    // MARK: - Private Methods
    private func downloadBannerData(dispatch: DispatchGroup) {
        let config = RequestService.request(endpoint: endpoints.banner)
        
        dispatch.enter()
        ApiService.request(config: config, success: { [weak self] (result) in
            
            guard let contract = JSONDecoder.decode(BannerCollectionData.self, from: result) else {
                self?.error = ApiRequestError.parseObject
                dispatch.leave()
                return
            }
            
            self?.banners = contract.data
            dispatch.leave()
            
        }) { [weak self] (requestError) in
            self?.error = requestError
            dispatch.leave()
        }
    }
    
    private func downloadCategoryData(dispatch: DispatchGroup) {
        let config = RequestService.request(endpoint: endpoints.category)
        
        dispatch.enter()
        ApiService.request(config: config, success: { [weak self] (result) in
            
            guard let contract = JSONDecoder.decode(CategoryCollectionData.self, from: result) else {
                self?.error = ApiRequestError.parseObject
                dispatch.leave()
                return
            }
            
            self?.categories = contract.data
            dispatch.leave()
            
        }) { [weak self] (requestError) in
            self?.error = requestError
            dispatch.leave()
        }
    }
    
    private func downloadBestSellersData(dispatch: DispatchGroup) {
        let config = RequestService.request(endpoint: endpoints.bestSellers)
        
        dispatch.enter()
        ApiService.request(config: config, success: { [weak self] (result) in
            
            guard let contract = JSONDecoder.decode(ProductCollectionData.self, from: result) else {
                self?.error = ApiRequestError.parseObject
                dispatch.leave()
                return
            }
            
            self?.products = contract.data
            dispatch.leave()
            
        }) { [weak self] (requestError) in
            self?.error = requestError
            dispatch.leave()
        }
    }
}

// MARK: - HomeInteractorInputProtocol
extension HomeInteractor: HomeInteractorInputProtocol {
    func downloadData() {
        
        let dispatch = DispatchGroup()
        self.downloadBannerData(dispatch: dispatch)
        self.downloadCategoryData(dispatch: dispatch)
        self.downloadBestSellersData(dispatch: dispatch)
        
        dispatch.notify(queue: .main) {
            if let banner = self.banners, let categories = self.categories, let products = self.products {
                self.output?.contentResult(banner: banner, category: categories, bestSellers: products)
            } else if let error = self.error {
                self.output?.contentResult(error: error)
            }
        }
    }
}
