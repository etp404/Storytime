//
//  WholeStoryViewModelTest.swift
//  StorytimeTests
//
//  Created by Matthew Mould on 06/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
@testable import Storytime

class WholeStoryViewModelTest: XCTestCase {

    let mockStorytimeModel = MockStorytimeModel()
    
    override func setUp() {
        self.continueAfterFailure = true;
    }
    
    func testTitleIsSet() {
        let wholeStoryViewModel2 = WholeStoryViewModel(id:UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!, storyModel: mockStorytimeModel)
        XCTAssertEqual(wholeStoryViewModel2.title,
                       "Title A")
    }

    func testAssertContentIsReturned() {
        let wholeStoryViewModel2 = WholeStoryViewModel(id:UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!, storyModel: mockStorytimeModel)
        XCTAssertEqual(wholeStoryViewModel2.contentStrings[0],
                       "Section A1")
        XCTAssertEqual(wholeStoryViewModel2.contentStrings[1],
                       "Section A2")
    }


}
