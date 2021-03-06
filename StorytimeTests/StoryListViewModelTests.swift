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
        viewModel = StoryListViewModel(model:mockStorytimeModel,
                                       numberOfCardInStack:numberOfStoriesInStack,
                                       widthOfScreen:CGFloat(widthOfScreen))
    }
    
    func testGivenModelReturnsStories_thenStoriesCanBeReturned() throws {
        XCTAssertEqual(viewModel.storiesInStack.count, 3)
        XCTAssertEqual(viewModel.storiesInStack[0].title, "Title A")
        XCTAssertEqual(viewModel.storiesInStack[1].title, "Title B")
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
    
    func testGivenCardIsAtFront_WhenItIsMovedMoreThanHalfWayAcrossScreenToTheRight_ThenitIsDismissedFromModel() {
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        
        XCTAssertEqual(mockStorytimeModel.dismissedStoryIds.count, 1)
        XCTAssertTrue(mockStorytimeModel.dismissedStoryIds.contains(mockStorytimeModel.storyA.id))
    }
    
    func testGivenCardIsAtFront_WhenItIsMovedMoreThanHalfWayAcrossScreenToTheLeft_ThenitIsDismissedFromModel() {
        viewModel.storiesInStack[0].translation = CGSize(width:-widthOfScreen/2.0 - 1.0, height:0.0)
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
    
    func testGivenCardIsInTheMiddleNoViewIsShown() {
        XCTAssertEqual(viewModel.overlayOpacity, 0)
    }
    
    func testGivenCardIsHalfWayAcrossToTheLeft_OverlayIsShown() {
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0, height:0.0)
        
        XCTAssertEqual(viewModel.overlayOpacity, 1)
        XCTAssertEqual(viewModel.overlayText, "Save")
    }

    func testGivenCardIsSomeDistanceFromTheCentreToTheLeft_OverlayIsTheSameDistanceFromTheLeft() {
        let someDistance = CGFloat(20.0)
        let someCardWidth = CGFloat(50.0)
        viewModel.storiesInStack[0].width = someCardWidth
        viewModel.storiesInStack[0].translation = CGSize(width:-someDistance, height:0.0)

        XCTAssertEqual(viewModel.overlayTranslation, someDistance-someCardWidth)
    }

    func testGivenCardIsAtCentreToTheRight_OverlayIsOffscreen() {
        let someDistance = CGFloat(0.0)
        let someCardWidth = CGFloat(50.0)
        viewModel.storiesInStack[0].width = someCardWidth
        viewModel.storiesInStack[0].translation = CGSize(width:someDistance, height:0.0)

        XCTAssertEqual(viewModel.overlayTranslation, CGFloat(widthOfScreen))
    }

    func testGivenCardIsSomeDistanceFromTheCentreToTheRight_OverlayIsTheSameDistanceFromTheRight() {
        let someDistance = CGFloat(20.0)
        let someCardWidth = CGFloat(50.0)
        viewModel.storiesInStack[0].width = someCardWidth
        viewModel.storiesInStack[0].translation = CGSize(width:someDistance, height:0.0)

        XCTAssertEqual(viewModel.overlayTranslation, CGFloat(widthOfScreen) - someDistance)
    }

    func testGivenCardIsAllTheWayAcrossTheScreenToTheRight_OverlayAt0() {
        let someCardWidth = CGFloat(50.0)
        viewModel.storiesInStack[0].width = someCardWidth
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen, height:0.0)

        XCTAssertEqual(viewModel.overlayTranslation, CGFloat(0.0))
    }
    
    func testGivenCardIsHalfWayAcrossToTheRight_OverlayIsShown() {
        viewModel.storiesInStack[0].translation = CGSize(width:-widthOfScreen/2.0, height:0.0)
        
        XCTAssertEqual(viewModel.overlayOpacity, 1)
        XCTAssertEqual(viewModel.overlayText, "Dismiss")
    }
    
    func testGivenTopCardWasDismissed_NewTopCardIsHalfWayAcrossToTheRight_OverlayIsShown() {
        viewModel.storiesInStack[0].translation = CGSize(width:-widthOfScreen/2.0 - 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        viewModel.storiesInStack[0].translation = CGSize(width:-widthOfScreen/2.0, height:0.0)
        
        XCTAssertEqual(viewModel.overlayOpacity, 1)
        XCTAssertEqual(viewModel.overlayText, "Dismiss")
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
    
    func testGivenStoryIsSwipedRight_storyIsAddedToFavourites() throws {
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 + 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        
        XCTAssertEqual(mockStorytimeModel.savedStories.count, 1)
        XCTAssertEqual(mockStorytimeModel.savedStories[0], mockStorytimeModel.storyA.id)
    }
    
    func testGivenStoryIsSwipedRightInsufficiently_storyIsNotAddedToFavourites() throws {
        viewModel.storiesInStack[0].translation = CGSize(width:widthOfScreen/2.0 - 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        
        XCTAssertEqual(mockStorytimeModel.savedStories.count, 0)
    }
    
    func testGivenStoryIsSwipedLeft_storyIsNotAddedToFavourites() throws {
        viewModel.storiesInStack[0].translation = CGSize(width:-widthOfScreen/2.0 - 1.0, height:0.0)
        viewModel.swipeComplete(on: viewModel.storiesInStack[0])
        
        XCTAssertEqual(mockStorytimeModel.savedStories.count, 0)
    }
    
    func testGivenStoryHasContents_contentsAreIncludedInViewModel() {
        XCTAssertEqual(viewModel.storiesInStack[0].contents[0].id, mockStorytimeModel.storyA.contents[0].id)
        XCTAssertEqual(viewModel.storiesInStack[0].contents[0].body, mockStorytimeModel.storyA.contents[0].body)
        XCTAssertEqual(viewModel.storiesInStack[1].contents[1].id, mockStorytimeModel.storyB.contents[1].id)
        XCTAssertEqual(viewModel.storiesInStack[1].contents[1].body, mockStorytimeModel.storyB.contents[1].body)
    }
    
}
