//
//  StoryTimeTests.swift
//  StoryTimeTests
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
@testable import Storytime

class StoryListTests: XCTestCase {

    class MockStorytimeModel : StorytimeModel {
        func stories() -> [Story] {
            return [Story(title:"A"),
                    Story(title:"B"),
                    Story(title:"C"),
                    Story(title:"D")]
        }
    }
    
    let numberOfStoriesInStack:Int = 2
    
    var viewModel:StoryListViewModel!
    
    override func setUp() {
        self.continueAfterFailure = false;
        viewModel = StoryListViewModel(model:MockStorytimeModel(), numberOfCardInStack:numberOfStoriesInStack)

    }
    func testGivenModelReturnsStories_thenStoriesCanBeReturned() throws {
        XCTAssertEqual(viewModel.stories().count, 2)
        XCTAssertEqual(viewModel.stories()[0].title, "A")
        XCTAssertEqual(viewModel.stories()[1].title, "B")
    }
}
