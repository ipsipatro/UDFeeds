//
//  UDFeedsAPIRouter.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import Alamofire

enum UDFeedsAPIRouter: URLRequestConvertible {
    case getFeeds
    fileprivate static let apiUrlV1 = "http://demo7034352.mockable.io/"
    
    fileprivate var method: HTTPMethod {
        switch self {
        case .getFeeds:
            return .get
        }
    }
    
    fileprivate var path: String {
        switch self {
        case .getFeeds:
            return "getFeeds"
        }
    }
    
    fileprivate var bodyParameters: Parameters {
        switch self {
        case .getFeeds:
            return [:]
        }
    }
    
    
    fileprivate var apiUrl : String {
        switch self {
        case .getFeeds:
            return UDFeedsAPIRouter.apiUrlV1
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try apiUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if bodyParameters.count > 0 {
            urlRequest = try JSONEncoding.default.encode(urlRequest, withJSONObject: bodyParameters)
        }
        
        return urlRequest
    }
    
}

