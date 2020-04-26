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
        let storyB = Story(title:"B")

        func stories() -> [Story] {
            return [Story(title:"A"),
                    storyB,
                    Story(title:"C"),
                    Story(title:"D")]
        }
    }
    
    let numberOfStoriesInStack:Int = 3
    
    var viewModel:StoryListViewModel!
    var mockStorytimeModel:MockStorytimeModel!
    
    override func setUp() {
        self.continueAfterFailure = false;
        mockStorytimeModel = MockStorytimeModel()
        viewModel = StoryListViewModel(model:mockStorytimeModel, numberOfCardInStack:numberOfStoriesInStack)
    }
  
    func testGivenModelReturnsStories_thenStoriesCanBeReturned() throws {
        XCTAssertEqual(viewModel.stories().count, 3)
        XCTAssertEqual(viewModel.stories()[0].title, "A")
        XCTAssertEqual(viewModel.stories()[1].title, "B")
    }
    
    func testGivenModelIsToldToDismissStory_thenStoryIsRemoved() throws {
        viewModel.dismissStory(id:mockStorytimeModel.storyB.id)
        XCTAssertEqual(viewModel.stories()[1].title, "C")
    }
}
