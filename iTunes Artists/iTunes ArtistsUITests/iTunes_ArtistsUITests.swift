//
//  iTunes_ArtistsUITests.swift
//  iTunes ArtistsUITests
//
//  Created by Eduardo Leite on 07/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import XCTest

// swiftlint:disable all
class iTunes_ArtistsUITests: XCTestCase {

    func testLoadCorrectly() {
        let app = XCUIApplication()
        app.launch()
        let searchByArtistSNameSearchField = app.navigationBars["iTunes_Artists.TrackListView"].searchFields["Search by Artist's Name"]
        searchByArtistSNameSearchField.tap()
        searchByArtistSNameSearchField.typeText("Beyonce")
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"buscar\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(5)
        let tracksCount = app.collectionViews.cells.count
        XCTAssert(tracksCount > 0)
        XCTAssert(tracksCount < 11)
    }
}
