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
    var story:String?

    init(model: StorytimeModel) {
        self.model = model
    }

    func submitPressed() {
        guard let story = story else { return }
        model.submitStory(story: Story(id: UUID(), title: "", contents: [StorySection(id: UUID(), body: story)]))
    }
}

class ComposeViewModelTests: XCTestCase {

    func testSubmitButtonStringIsAsExpected() throws {
        let composeViewModel = ComposeViewModel(model: MockStorytimeModel())
        XCTAssertEqual(composeViewModel.buttonTitle, "Submit")
    }

    func testWhenSubmitIsTapped_StoryIsSentToModel() throws {
        let someStory = "Once upon a time"
        let model = MockStorytimeModel()
        let composeViewModel = ComposeViewModel(model: model)

        composeViewModel.story = someStory
        composeViewModel.submitPressed()

        let story = try XCTUnwrap(model.submittedStory)

        XCTAssertEqual(story.contents.count, 1)
        XCTAssertEqual(story.contents[0].body, someStory)
    }


}
