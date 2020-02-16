//
//  TrackModel.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 07/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation

struct Track: Decodable {
    let artistId: Int?
    let collectionId: Int?
    let trackId: Int?
    let artistName: String?
    let trackCensoredName: String?
    let artistViewUrl: String?
    let trackTimeMillis: Int?
    let artworkUrl100: String?
    let previewUrl: String?
}
