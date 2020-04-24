//
//  StoryTimeTests.swift
//  StoryTimeTests
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
@testable import Storytime

class StorytimeTests: XCTestCase {

    class MockStorytimeModel : StorytimeModel {
        func stories() -> [Story] {
            return [Story(title:"A"),
                    Story(title:"B")]
        }
    }
    
    func testGivenModelReturnsStories_thenStoriesCanBeReturned() throws {
        self.continueAfterFailure = false;

        let viewModel = StorytimeViewModel(model:MockStorytimeModel())
        

        XCTAssertEqual(viewModel.stories().count, 2)
        XCTAssertEqual(viewModel.stories()[0].title, "A")
        XCTAssertEqual(viewModel.stories()[1].title, "B")
    }
}
