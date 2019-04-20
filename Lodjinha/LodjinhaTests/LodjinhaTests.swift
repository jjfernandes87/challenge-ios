//
//  LodjinhaTests.swift
//  LodjinhaTests
//
//  Created by Julio Fernandes on 20/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import Quick
import Nimble
@testable import Lodjinha

class LodjinhaTests: QuickSpec {
    
    override func spec() {
        
        describe("Test: AppDelegate") {
            
            let appdelegate = AppDelegate()
            
            it ("method: initWindow") {
                expect(appdelegate.window).toEventually(beNil())
                appdelegate.initWindow()
                expect(appdelegate.window).toEventuallyNot(beNil())
            }
            
            it ("method: initMainRouter") {
                expect(appdelegate.tabbarRouter).toEventually(beNil())
                appdelegate.initMainRouter()
                expect(appdelegate.tabbarRouter).toEventuallyNot(beNil())
            }
        }
        
        describe("Test: TabbarWireframe") {
            
            let appdelegate = AppDelegate()
            
            beforeEach {
                appdelegate.initWindow()
                appdelegate.initMainRouter()
            }
            
            it ("method: launchApp") {
                expect(appdelegate.tabbarRouter?.viewControllers?.count).to(equal(2))
            }
        }
        
        describe("Test: ApiRequestError") {
            it ("message: no internet") {
                let message = ApiRequestError(rawValue: 0)
                expect(message?.message()).to(equal("Verifique sua conexão com a internet"))
            }
            
            it ("message: no parseObject") {
                let message = ApiRequestError(rawValue: 1)
                expect(message?.message()).to(equal("Estamos passando por um momento de instabilidade"))
            }
            
            it ("message: no unauthorized") {
                let message = ApiRequestError(rawValue: 401)
                expect(message?.message()).to(equal("Você não tem permissão para acessar esse conteúdo"))
            }
            
            it ("message: no forbidden") {
                let message = ApiRequestError(rawValue: 403)
                expect(message?.message()).to(equal("Você não tem permissão para acessar esse conteúdo"))
            }
            
            it ("message: no notFound") {
                let message = ApiRequestError(rawValue: 404)
                expect(message?.message()).to(equal("Conteúdo não encontrado, tente novamente"))
            }
            
            it ("message: no serverError") {
                let message = ApiRequestError(rawValue: 500)
                expect(message?.message()).to(equal("Estamos passando por um momento de instabilidade, tente novamente em instantes"))
            }
            
            it ("message: no timeout") {
                let message = ApiRequestError(rawValue: 504)
                expect(message?.message()).to(equal("Estamos passando por um momento de instabilidade, tente novamente em instantes"))
            }
            
        }
        
        describe("Test: PriceFormatter") {
            it ("method: changeCharactersInRangeFormatter") {
                let result = PriceFormatter.shared.changeCharactersInRangeFormatter(NSRange(location: 2, length: 0), string: "3", currentString: "12")
                expect(result).to(equal("123"))
            }
            
            it ("method: doubleToCurrencyStringFormatter") {
                let result = PriceFormatter.shared.doubleToCurrencyStringFormatter(20)
                expect(result).to(equal("R$ 20,00"))
            }
            
        }
        
        describe("Test: CategoryCollectionData") {
            
            var json: String?
            var contract: CategoryCollectionData?
            
            beforeEach {
                json = "{\"data\":[{\"id\": 1,\"descricao\": \"categoria\",\"urlImagem\": \"https://images.png\"}]}"
                contract = JSONDecoder.decode(CategoryCollectionData.self, from: json)
            }
            
            it ("parse: CategoryCollectionData") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
            }
            
            it ("validate: CategoryCollectionData") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
                expect(contract?.data.count).toEventually(equal(1))
            }
            
        }
        
        describe("Test: ProductCollectionData") {
            
            var json: String?
            var contract: ProductCollectionData?
            
            beforeEach {
                json = "{\"data\":[{\"id\": 1,\"nome\": \"produto\",\"urlImagem\": \"https://images.png\",\"descricao\": \"descricao\",\"precoDe\": 100,\"precoPor\": 200,\"categoria\": {\"id\": 1,\"descricao\": \"categoria\",\"urlImagem\": \"https://images.png\"}}]}"
                contract = JSONDecoder.decode(ProductCollectionData.self, from: json)
            }
            
            it ("parse: ProductCollectionData") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
            }
            
            it ("validate: ProductCollectionData") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
                expect(contract?.data.count).toEventually(equal(1))
            }
            
        }
        
        describe("Test: Product") {
            
            var json: String?
            var contract: Product?
            
            beforeEach {
                json = "{\"id\": 1,\"nome\": \"produto\",\"urlImagem\": \"https://images.png\",\"descricao\": \"descricao\",\"precoDe\": 100,\"precoPor\": 200,\"categoria\": {\"id\": 1,\"descricao\": \"categoria\",\"urlImagem\": \"https://images.png\"}}"
                contract = JSONDecoder.decode(Product.self, from: json)
            }
            
            it ("parse: Product") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
            }
            
            it ("validate: Product") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
                expect(contract?.id).toEventually(equal(1))
                expect(contract?.price).toEventually(equal(100))
                expect(contract?.newPrice).toEventually(equal(200))
                expect(contract?.imagePath).toEventually(equal(URL(string: "https://images.png")))
                expect(contract?.name).toEventually(equal("produto"))
                expect(contract?.detail).toEventually(equal("descricao"))
                expect(contract?.category.id).toEventually(equal(1))
                expect(contract?.category.category).toEventually(equal("categoria"))
                expect(contract?.category.imagePath).toEventually(equal(URL(string: "https://images.png")))
            }
            
        }
        
        describe("Test: BannerCollection") {
            
            var json: String?
            var contract: BannerCollectionData?
            
            beforeEach {
                json = "{\"data\":[{\"id\": 1,\"urlImagem\": \"http://www.image.com\", \"linkUrl\": \"http://www.link.com\"}]}"
                contract = JSONDecoder.decode(BannerCollectionData.self, from: json)
            }
            
            it ("parse: BannerCollection") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
            }
            
            it ("validate: BannerCollection") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
                expect(contract?.data.count).toEventually(equal(1))
            }
            
        }
        
        describe("Test: Banner") {
            
            var json: String?
            var contract: Banner?
            
            beforeEach {
                json = "{\"id\": 1,\"urlImagem\": \"http://www.image.com\", \"linkUrl\": \"http://www.link.com\"}"
                contract = JSONDecoder.decode(Banner.self, from: json)
            }
            
            it ("parse: Banner") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
            }
            
            it ("validate: Banner") {
                expect(json).notTo(beNil())
                expect(contract).notTo(beNil())
                expect(contract?.id).toEventually(equal(1))
                expect(contract?.imagePath).toEventually(equal(URL(string: "http://www.image.com")))
                expect(contract?.linkUrl).toEventually(equal(URL(string: "http://www.link.com")))
            }
            
        }
    }

}
