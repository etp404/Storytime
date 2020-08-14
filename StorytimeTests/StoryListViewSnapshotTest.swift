//
//  StoryListViewSnapshotTest.swift
//  StorytimeTests
//
//  Created by Matt Mould on 14/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Storytime

class StoryListViewSnapshotTest: XCTestCase {

    func testStoryListView() throws {
        let model = MockStorytimeModel()
        let storyListView = StoryListView(storyTimeModel: model)

        assertSnapshot(matching: storyListView, as: .image)
    }


}
