//
//  ComposeViewModelTests.swift
//  StorytimeTests
//
//  Created by Matt Mould on 14/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
import Combine
@testable import Storytime

class ComposeViewModelTests: XCTestCase {
    
    var cancellable: Cancellable?
    
    func testSubmitButtonStringIsAsExpected() throws {
        let composeViewModel = ComposeViewModel(model: MockStorytimeModel())
        XCTAssertEqual(composeViewModel.buttonTitle, "Submit")
    }
    
    func testWhenSubmitIsTapped_StoryIsSentToModel() throws {
        let someStoryTitle = "Once upon a time"
        let someStoryBody = "Once upon a time"
        let model = MockStorytimeModel()
        let composeViewModel = ComposeViewModel(model: model)
        
        composeViewModel.storyTitle = someStoryTitle
        composeViewModel.storyBody = someStoryBody
        composeViewModel.submitPressed()
        
        let story = try XCTUnwrap(model.submittedStory)
        
        XCTAssertEqual(story.contents.count, 1)
        XCTAssertEqual(story.title, someStoryTitle)
        XCTAssertEqual(story.contents[0].body, someStoryBody)
    }
    
    func testStoryIsClearedWhenItIsSubmitted() throws {
        let someStoryTitle = "Once upon a time"
        let someStoryBody = "Once upon a time"
        let model = MockStorytimeModel()
        let composeViewModel = ComposeViewModel(model: model)
        
        composeViewModel.storyTitle = someStoryTitle
        composeViewModel.storyBody = someStoryBody
        composeViewModel.submitPressed()
        
        XCTAssertEqual(composeViewModel.storyTitle, "")
        XCTAssertEqual(composeViewModel.storyBody, "")
    }
    
    func testViewModelTitleCanBeObserved() throws {
        let model = MockStorytimeModel()
        let composeViewModel = ComposeViewModel(model: model)
        composeViewModel.storyTitle = "Once upon a time"
        composeViewModel.storyBody = "Once upon a time"
        var capturedStoryTitle:String?
        cancellable = composeViewModel.$storyTitle.sink() {storyTitle in
            capturedStoryTitle = storyTitle
        }
        composeViewModel.submitPressed()
        
        let unwrappedCapturedStoryTitle = try XCTUnwrap(capturedStoryTitle)
        XCTAssertEqual(unwrappedCapturedStoryTitle, "")
    }
    
    func testViewModelBodyCanBeObserved() throws {
        let model = MockStorytimeModel()
        let composeViewModel = ComposeViewModel(model: model)
        composeViewModel.storyTitle = "Once upon a time"
        composeViewModel.storyBody = "Once upon a time"
        var capturedStoryBody:String?
        cancellable = composeViewModel.$storyBody.sink() {storyBody in
            capturedStoryBody = storyBody
        }
        composeViewModel.submitPressed()
        
        let unwrappedCapturedStoryTitle = try XCTUnwrap(capturedStoryBody)
        XCTAssertEqual(unwrappedCapturedStoryTitle, "")
    }
    
    
}
