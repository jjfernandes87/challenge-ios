//
//  ApiService.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import Alamofire

enum ApiRequestError: Int {
    case networkConnection
    case parseObject
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case serverError = 500
    case timeout = 504
    
    func message() -> String {
        switch self {
        case .networkConnection: return "Verifique sua conexão com a internet"
        case .unauthorized: return "Você não tem permissão para acessar esse conteúdo"
        case .forbidden: return "Você não tem permissão para acessar esse conteúdo"
        case .notFound: return "Conteúdo não encontrado, tente novamente"
        case .timeout: return "Estamos passando por um momento de instabilidade, tente novamente em instantes"
        case .serverError: return "Estamos passando por um momento de instabilidade, tente novamente em instantes"
        case .parseObject: return "Estamos passando por um momento de instabilidade"
        }
    }
    
}

struct RequestConfig {
    var url: URL
    var method: HTTPMethod
    var parameters: Parameters? = nil
    var headers: HTTPHeaders? = nil
    var parametersEncoding: ParameterEncoding? = JSONEncoding.default
}

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()
    static var isConnectedToInternet : Bool? {
        return self.sharedInstance?.isReachable
    }
}

typealias success = ((_ result: String?) -> Void)
typealias failure = ((_ error: ApiRequestError) -> Void)

class ApiService: NSObject {
    
    class func request(config: RequestConfig, success: @escaping success, failure: @escaping failure) {
        
        if let hasConnection = Connectivity.isConnectedToInternet, !hasConnection {
            failure(ApiRequestError.networkConnection)
            return
        }
        
        Alamofire.request(config.url,
                          method: config.method,
                          parameters: config.parameters,
                          encoding: config.parametersEncoding!,
                          headers: ApiService.setHeader(config: config)
            )
            .validate(statusCode: 200..<300)
            .debugLog()
            .responseString(encoding: String.Encoding.utf8) { (response) in
                switch response.result {
                case .success:
                    success(response.value)
                case .failure(_):
                    failure(ApiRequestError(rawValue: response.response?.statusCode ?? 500) ?? ApiRequestError.networkConnection)
                }
        }
    }
}

// MARK: - Header
extension ApiService {
    class func setHeader(config: RequestConfig) -> HTTPHeaders {
        var headers = [String: String]()
        if let requestHeaders = config.headers { headers.merge(requestHeaders) { (_, new) in new } }
        return headers
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }
}

extension JSONDecoder {
    
    static func decode<T>(_ type: T.Type, from jsonString: String?) -> T? where T : Decodable {
        let decoder = JSONDecoder()
        guard let data = jsonString, let jsonData = data.data(using: .utf8) else {
            return nil
        }
        
        do {
            let obj = try decoder.decode(type, from: jsonData)
            return obj
        } catch {
            print(error)
            return nil
        }
    }
}
