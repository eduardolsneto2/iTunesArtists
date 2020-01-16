//
//  Delegates.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit

protocol TrackListViewModelDelegate: class {
    func didLoadData()
    func setBackgroundView(withText text: String?, image: UIImage?)
    func showSkeleton()
    func stopSkeleton()
}

protocol TrackListViewModelType {
    var delegate: TrackListViewModelDelegate? { get set }
    var lastSearch:String { get set }
    var page:Int { get set }
    var noMorePages:Bool { get set }
    func search(searchText:String)
    func getTrackSize() -> Int?
    func getTrack(at index: Int) -> Track?
    func reloadLastSearch()
}

protocol TrackViewModelType {
    var artistName: String? { get }
    var trackName: String? { get }
    var trackTime: String? { get }
    var artworkURL: URL? { get }
}
