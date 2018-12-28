//
//  MountainChallengeUITests.swift
//  MountainChallengeUITests
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import XCTest

class MountainChallengeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBaseNavigationWithoutLikeSelection() {
        // Accessing mountain list
        let table = app.tables.firstMatch
        
        // Select a first one
        let firstCell = table.cells.firstMatch
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
        
        // Acessing mountain detail
        let likeCountLabel = app.staticTexts["LikeCountLabel"]
        XCTAssertEqual(likeCountLabel.label, "175")
        
        // Select to back
        app.navigationBars.buttons.firstMatch.tap()
        
        // Assert first cell like count
        XCTAssertTrue(firstCell.exists)
        let tableCellLikeCountLabel = firstCell.staticTexts.element(boundBy: 2)
        XCTAssertEqual(tableCellLikeCountLabel.label, "175")
    }

    func testBaseNavigationWithLikeSelection() {
        // Accessing mountain list
        let table = app.tables.firstMatch
        
        // Select a first one
        let firstCell = table.cells.firstMatch
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
        
        // Acessing mountain detail
        let likeCountLabel = app.staticTexts["LikeCountLabel"]
        XCTAssertEqual(likeCountLabel.label, "175")
        
        // Select a like button
        app.buttons["LikeButton"].tap()
        
        // Assert mountain detail like count
        XCTAssertEqual(likeCountLabel.label, "176")
        
        // Select to back
        app.navigationBars.buttons.firstMatch.tap()
        
        // Assert first cell like count
        XCTAssertTrue(firstCell.exists)
        let tableCellLikeCountLabel = firstCell.staticTexts.element(boundBy: 2)
        XCTAssertEqual(tableCellLikeCountLabel.label, "176")
    }

}
