//
//  EndPoints.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class EndPoints: EndPointsProtocol {
    var banner: String { return "https://alodjinha.herokuapp.com/banner" }
    var category: String { return "https://alodjinha.herokuapp.com/categoria" }
    var product: String { return "https://alodjinha.herokuapp.com/produto" }
    var bestSellers: String { return "https://alodjinha.herokuapp.com/produto/maisvendidos" }
    var productDetail: String { return "https://alodjinha.herokuapp.com/produto/{id}" }
}

protocol EndPointsProtocol {
    var banner: String { get }
    var category: String { get }
    var product: String { get }
    var bestSellers: String { get }
    var productDetail: String { get }
}
