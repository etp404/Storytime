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
    var storytimeViewNavigation: StorytimeViewNavigation!
    
    override func setUp() {
        self.continueAfterFailure = true;
        storytimeViewNavigation = StorytimeViewNavigation(storytimeModel: mockStorytimeModel)
    }
    
    func testTitleIsSet() {
        XCTAssertEqual(storytimeViewNavigation.wholeStoryViewModel(id: mockStorytimeModel.storyA.id).title, mockStorytimeModel.storyA.title)
    }
    
    func testAssertContentIsReturned() {
        XCTAssertEqual(storytimeViewNavigation.wholeStoryViewModel(id: mockStorytimeModel.storyB.id).content[0], mockStorytimeModel.storyB.content[0])
        XCTAssertEqual(storytimeViewNavigation.wholeStoryViewModel(id: mockStorytimeModel.storyB.id).content[1], mockStorytimeModel.storyB.content[1])
    }


}
