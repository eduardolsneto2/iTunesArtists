//
//  WatchTrackViewModel.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 09/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation

class WatchTrackViewModel: WatchTrackViewModelType {
    
    internal var track: Track
    
    var artistName: String? {
        return track.artistName
    }
    
    var trackTitle: String? {
        return track.trackCensoredName
    }
    var url: String? {
        return track.previewUrl
    }
    
    var artistViewURL: String? {
        return track.artistViewUrl
    }
    
    init(track:Track) {
        self.track = track
    }
}
