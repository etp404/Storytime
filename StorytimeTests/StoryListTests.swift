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
    
    func testGivenModelReturnsStories_thenStoriesCanBeReturned() throws {
        self.continueAfterFailure = false;

        let viewModel = StoryListViewModel(model:MockStorytimeModel())
        

        XCTAssertEqual(viewModel.stories(limit:2).count, 2)
        XCTAssertEqual(viewModel.stories(limit:2)[0].title, "A")
        XCTAssertEqual(viewModel.stories(limit:2)[1].title, "B")
    }
}
