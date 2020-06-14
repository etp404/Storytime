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
        let myStories = myStoriesViewModel.myStories
        XCTAssertEqual(myStories.count, 3)
        XCTAssertEqual(myStories[1].title, mockModel.myStoryB.title)
    }
    
    func testThatStoryTitlesAreUpdatedWhenTheModelIsUpdated() {
        let mockModel = MockStorytimeModel()
        let myStoriesViewModel = MyStoriesViewModel(model:mockModel)
        XCTAssertEqual(myStoriesViewModel.myStories.count, 3)
        
        mockModel.addStoryToMyStoriesAndNotify()
        XCTAssertEqual(myStoriesViewModel.myStories.count, 4)
    }

}
