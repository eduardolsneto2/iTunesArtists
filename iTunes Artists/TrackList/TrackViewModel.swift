//
//  TrackViewModel.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation

class TrackViewModel: TrackViewModelType {
    private var track: Track
    
    var artistName: String? {
        return track.artistName
    }
    
    var trackName: String? {
        return track.trackCensoredName
    }
    
    var trackTime: String? {
        guard let timeMili = track.trackTimeMillis else { return "" }
        let minutes = Int(timeMili/60000)
        let seconds = Int((timeMili%60000)/1000)
        var minutesStr = minutes.description
        var secondsStr = seconds.description
        if minutes < 10 {
            minutesStr = "0" + minutesStr
        }
        if seconds < 10 {
            secondsStr = "0" + secondsStr
        }
        let formattedTime = minutesStr + ":" + secondsStr
        return formattedTime
    }
    
    var artworkURL: URL? {
        guard let artworkUrl = track.artworkUrl100 else { return nil }
        let betterQualityArtWork = artworkUrl.replacingOccurrences(of: "source/100x100bb.jpg", with: "source/1000x1000bb.jpg")
        return URL(string: betterQualityArtWork)
        
    }
    
    init(track: Track) {
        self.track = track
    }
}
