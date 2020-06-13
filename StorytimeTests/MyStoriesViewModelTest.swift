//
//  MyStoriesViewModel.swift
//  StorytimeTests
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
@testable import Storytime

class MyStoriesViewModelTest: XCTestCase {

    func testThatStoryTitlesCanBeReturned() throws {
        let mockModel = MockStorytimeModel()
        let myStoriesViewModel = MyStoriesViewModel(model:MockStorytimeModel())
        let myStories = myStoriesViewModel.titles
        XCTAssertEqual(myStories.count, 3)
        XCTAssertEqual(myStories[1], mockModel.myStoryB.title)
        
    }


}
