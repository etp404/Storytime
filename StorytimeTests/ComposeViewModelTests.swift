//
//  ComposeViewModelTests.swift
//  StorytimeTests
//
//  Created by Matt Mould on 14/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
@testable import Storytime

class ComposeViewModel {
    let model: StorytimeModel
    let buttonTitle = "Submit"
    var storyTitle:String?
    var storyBody:String?

    init(model: StorytimeModel) {
        self.model = model
    }

    func submitPressed() {
        guard let storyBody = storyBody, let storyTitle = storyTitle else { return }
        model.submitStory(story: Story(id: UUID(), title: storyTitle, contents: [StorySection(id: UUID(), body: storyBody)]))
    }
}

class ComposeViewModelTests: XCTestCase {

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


}
