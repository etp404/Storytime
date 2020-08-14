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

    override class func setUp() {
        let device = UIDevice.current.name
        if device != "iPhone 11" {
            fatalError("Switch to using iPhone 11 for these tests.")
        }

    }

    func testStoryListView() throws {
        let model = MockStorytimeModel()
        let storyListView = StoryListView(storyTimeModel: model)

        assertSnapshot(matching: storyListView, as: .image)
    }

    func testStoryListUpdatesWhenCardIsDismissed() throws {
        let vm = StoryListViewModel(model: MockStorytimeModel(), numberOfCardInStack: 6, widthOfScreen: 400)
        let storyListView = StoryListView(viewModel: vm)
        vm.storiesInStack[0].translation = CGSize(width: 300, height: 0)
        vm.swipeComplete(on: vm.storiesInStack[0])

        assertSnapshot(matching: storyListView, as: .image)
    }
}
