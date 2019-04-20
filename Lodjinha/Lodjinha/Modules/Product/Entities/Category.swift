//
//  Category.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

struct CategoryCollectionData: Codable {
    let data: [Category]
}

struct Category: Codable {
    let id: Int
    let category: String
    let imagePath: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case category = "descricao"
        case imagePath = "urlImagem"
    }
}
