//
//  Banner.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Foundation

class BannerCollectionData: Codable {
    let data: [Banner]
}

class Banner: Codable {
    let id: Int
    let imagePath: URL
    let linkUrl: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case linkUrl
        case imagePath = "urlImagem"
    }
}
