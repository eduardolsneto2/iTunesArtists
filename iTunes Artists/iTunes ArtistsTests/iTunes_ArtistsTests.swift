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

    func testSearchResquest() {
        let client = TrackClient()
        let requestExpectation = expectation(description: "Request-Track")
        var didFail = true
        client.getTracks(with: "Beyonce", andPage: 0) { result in
            switch result {
            case .success(let trackResult):
                guard let tracks = trackResult else { return }
                guard let _ = tracks.results else { return }
                requestExpectation.fulfill()
            default:
                break
            }
            didFail = false
        }
        wait(for: [requestExpectation], timeout: 10.0)
        XCTAssertFalse(didFail)
    }
    
    func testCreatingEmptyWatchVM() {
        let watchTrackVM = WatchTrackViewModel(track: Track(artistId: nil, collectionId: nil, trackId: nil, artistName: nil, trackCensoredName: nil, artistViewUrl: nil, trackTimeMillis: nil, artworkUrl100: nil, previewUrl: nil))
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
        XCTAssertNoThrow(trackListVC.trackListVM?.search(searchText: ""))
        XCTAssertNil(trackListVC.trackListVM?.getTrackSize())
        XCTAssertNoThrow(trackListVC.trackListVM?.getTrack(at: 1))
        XCTAssertNil(trackListVC.trackListVM?.getTrack(at: 1))
    }

}
