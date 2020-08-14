//
//  StoryListViewSnapshotTest.swift
//  StorytimeTests
//
//  Created by Matt Mould on 14/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import Storytime

class StoryListViewSnapshotTest: XCTestCase {

    func testStoryListView() throws {
        let device = UIDevice.current.name
        if device != "iPhone 11" {
            fatalError("Switch to using iPhone 11 for these tests.")
        }

        let model = MockStorytimeModel()
        let storyListView = StoryListView(storyTimeModel: model)

        assertSnapshot(matching: storyListView, as: .image)
    }
}
