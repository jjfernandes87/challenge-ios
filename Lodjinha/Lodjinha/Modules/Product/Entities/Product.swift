//
//  Product.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class ProductCollectionData: Codable {
    let data: [Product]
}

class Product: Codable {
    let id: Int
    let name: String
    let imagePath: URL
    let detail: String
    let price: Double
    let newPrice: Double
    let category: Category
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "precoDe"
        case detail = "descricao"
        case newPrice = "precoPor"
        case category = "categoria"
        case imagePath = "urlImagem"
    }
}
