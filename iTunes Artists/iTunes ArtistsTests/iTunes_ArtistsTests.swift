//
//  iTunes_ArtistsTests.swift
//  iTunes ArtistsTests
//
//  Created by Eduardo Leite on 07/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import XCTest
@testable import iTunes_Artists

// swiftlint:disable all
class iTunes_ArtistsTests: XCTestCase {

    func testCreatingEmptyWatchVM() {
        let watchTrackVM = WatchTrackViewModel(track: Track())
        let watchTrackVC = WatchTrackViewController()
        watchTrackVC.watchTrackVM = watchTrackVM
        XCTAssertNil(watchTrackVC.watchTrackVM?.artistName)
        XCTAssertNil(watchTrackVC.watchTrackVM?.artistViewURL)
        XCTAssertNil(watchTrackVC.watchTrackVM?.trackTitle)
        XCTAssertNil(watchTrackVC.songTitle?.text)
        XCTAssertNil(watchTrackVC.artistName?.text)
        XCTAssertNoThrow(watchTrackVC.viewSettup())
    }
    
    func testSearchForEmptyString() {
        let trackListVM = TrackListViewModel()
        let trackListVC = TrackListViewController()
        trackListVC.trackListVM = trackListVM
        XCTAssertNoThrow(trackListVC.trackListVM.search(searchText: ""))
        XCTAssertNil(trackListVC.trackListVM.getTrackSize())
        XCTAssertNoThrow(trackListVC.trackListVM.getTrack(at: 1))
        XCTAssertNil(trackListVC.trackListVM.getTrack(at: 1))
    }

}
