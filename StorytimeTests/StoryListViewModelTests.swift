//
//  StoryTimeTests.swift
//  StoryTimeTests
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
@testable import Storytime

class StoryListViewModelTests: XCTestCase {
    
    let numberOfStoriesInStack:Int = 3
    let widthOfScreen = 400.0

    var viewModel:StoryListViewModel!
    var mockStorytimeModel:MockStorytimeModel!
    
    override func setUp() {
        self.continueAfterFailure = true;
        mockStorytimeModel = MockStorytimeModel()
        viewModel = StoryListViewModel(model:mockStorytimeModel, numberOfCardInStack:numberOfStoriesInStack, widthOfScreen:CGFloat(widthOfScreen))
    }
  
    func testGivenModelReturnsStories_thenStoriesCanBeReturned() throws {
        XCTAssertEqual(viewModel.storiesInStack.count, 3)
        XCTAssertEqual(viewModel.storiesInStack[0].title, "A")
        XCTAssertEqual(viewModel.storiesInStack[1].title, "B")
    }
    
    func testGivenCardIsAtFront_WhenItIsMovedMoreThanHalfWayAcrossScreen_ThenitIsDismissedFromStack() {
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])

        XCTAssertEqual(viewModel.storiesInStack[0].storyId, mockStorytimeModel.storyB.id)
        XCTAssertEqual(viewModel.storiesInStack[1].storyId, mockStorytimeModel.storyC.id)
    }

    func testGivenCardIsNotAtFront_WhenItIsMovedMoreThanHalfWayAcrossScreen_ThenItIsNotDismissedFromStack() {
        viewModel.storiesInStack[1].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[1])

        XCTAssertEqual(viewModel.storiesInStack[0].storyId, mockStorytimeModel.storyA.id)
        XCTAssertEqual(viewModel.storiesInStack[1].storyId, mockStorytimeModel.storyB.id)
        XCTAssertEqual(viewModel.storiesInStack[1].translation, CGSize(width:0.0, height:0.0))
    }

    func testGivenCardIsAtFront_WhenItIsMovedLessThanHalfWayAcrossScreen_ThenItIsNotDismissedFromStack() {
        viewModel.storiesInStack[1].translation = CGSize(width:widthOfScreen/2.0 - 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])

        XCTAssertEqual(viewModel.storiesInStack[0].storyId, mockStorytimeModel.storyA.id)
        XCTAssertEqual(viewModel.storiesInStack[1].storyId, mockStorytimeModel.storyB.id)
        XCTAssertEqual(viewModel.storiesInStack[1].translation, CGSize(width:0.0, height:0.0))
    }

    func testGivenCardIsAtFront_WhenItIsMovedMoreThanHalfWayAcrossScreen_ThenitIsDismissedFromModel() {
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])

        XCTAssertEqual(mockStorytimeModel.dismissedStoryIds.count, 1)
        XCTAssertTrue(mockStorytimeModel.dismissedStoryIds.contains(mockStorytimeModel.storyA.id))
    }

    func testGivenCardIsNotAtFront_WhenItIsMovedMoreThanHalfWayAcrossScreen_ThenItIsNotDismissedFromModel() {
        viewModel.storiesInStack[1].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[1])

        XCTAssertEqual(mockStorytimeModel.dismissedStoryIds.count, 0)
    }

    func testGivenCardIsAtFront_WhenItIsMovedLessThanHalfWayAcrossScreen_ThenItIsNotDismissedFromModel() {
        viewModel.storiesInStack[1].translation = CGSize(width:widthOfScreen/2.0 - 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        
        XCTAssertEqual(mockStorytimeModel.dismissedStoryIds.count, 0)
    }
    
    func testGivenCardIsDismissed_IndicesAreUpdated() {
       viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
       viewModel.swipeComplete(on: viewModel.storiesInStack[0])
       
        XCTAssertEqual(viewModel.storiesInStack[0].index, 0)
        XCTAssertEqual(viewModel.storiesInStack[1].index, 1)
   }
    
    
    func testGivenModelIsToldToDismissStory_anotherStoryIsObtainedFromModel() throws {
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])

        XCTAssertEqual(viewModel.storiesInStack.count, 3)
        XCTAssertEqual(viewModel.storiesInStack[2].storyId, mockStorytimeModel.storyF.id)
    }
    
    func testGivenStoryHasContent_contentIsIncludedInViewModel() {
        XCTAssertEqual(viewModel.storiesInStack[0].content, mockStorytimeModel.storyA.content[0])
    }
}
