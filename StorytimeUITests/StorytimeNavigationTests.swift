//
//  StoryTimeUITests.swift
//  StoryTimeUITests
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest

class StorytimeNavigationTests: XCTestCase {

    override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.

         // In UI tests it is usually best to stop immediately when a failure occurs.
         continueAfterFailure = false

         // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
     }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }
    
    func testStoriesCanBeDimissed() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons.containing(NSPredicate(format: "label CONTAINS '101 Dalmations'")).element.swipeRight()
        XCTAssertTrue(app.buttons.containing(NSPredicate(format: "label CONTAINS 'Story B'")).element.waitForExistence(timeout: 1))
    }
    
    func testCanNavigateToWholeStory() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons.containing(NSPredicate(format: "label CONTAINS '101 Dalmations'")).element.tap()
        XCTAssertTrue(app.staticTexts.containing(NSPredicate(format: "label CONTAINS '101 Dalmations'")).element.waitForExistence(timeout: 1))
    }
    
    func testThatFails() {
        XCTFail("Failure to test github action")
    }
}
