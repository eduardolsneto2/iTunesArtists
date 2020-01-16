//
//  Endpoint.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    func queryItens(searchTerm: String, page: Int) -> [URLQueryItem]
}

extension Endpoint {
    
    func getRequest(searchTerm: String, page:Int) -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItens(searchTerm: searchTerm, page: page)
        return URLRequest(url: urlComponents.url!)
    }
}

class TrackSearch: Endpoint {
    
    var scheme: String {
        return "https"
    }
    var host: String {
        return "itunes.apple.com"
    }
    var path: String {
        return "/search"
    }
    func queryItens(searchTerm: String, page:Int) -> [URLQueryItem] {
        var queryItens = [URLQueryItem]()
        queryItens.append(URLQueryItem(name: "term", value: searchTerm))
        queryItens.append(URLQueryItem(name: "entity", value: "musicVideo"))
        queryItens.append(URLQueryItem(name: "limit", value: "10"))
        queryItens.append(URLQueryItem(name: "offset", value: (page*10).description))
        return queryItens
    }
    
}
