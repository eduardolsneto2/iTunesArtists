//
//  Delegates.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 09/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation

protocol WatchTrackViewModelType {
    var track: Track { get set }
    var url: String? { get }
    var artistName: String? { get }
    var trackTitle: String? { get }
    var artistViewURL: String? { get }
}
