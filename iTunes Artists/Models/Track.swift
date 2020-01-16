//
//  TrackModel.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 07/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation

struct Track: Decodable {
    var artistId: Int?
    var collectionId: Int?
    var trackId: Int?
    var artistName: String?
    var trackCensoredName: String?
    var artistViewUrl: String?
    var trackTimeMillis: Int?
    var artworkUrl100: String?
    var previewUrl: String?
}
