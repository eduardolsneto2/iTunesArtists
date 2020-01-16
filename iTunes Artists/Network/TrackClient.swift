//
//  TrackClient.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation

class TrackClient: APIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getTracks(with searchTerm: String, andPage page:Int,
                   completion: @escaping (Result<TracksSearch?, APIError>) -> Void) {
        
        let endpoint = TrackSearch()
        let request = endpoint.getRequest(searchTerm: searchTerm, page: page)
        
        fetch(with: request, decode: { json -> TracksSearch? in
            guard let tracksSearch = json as? TracksSearch else { return  nil }
            return tracksSearch
        }, completion: completion)
    }
}
