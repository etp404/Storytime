//
//  ComposeViewTests.swift
//  StorytimeTests
//
//  Created by Matthew Mould on 16/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Storytime

class ComposeViewTests: XCTestCase {

    func testEmptyViewIsFormattedCorrectly() throws {
        let composeView = ComposeView(viewModel: ComposeViewModel(model: MockStorytimeModel()), text: "")

        assertSnapshot(matching:  composeView, as: .image)
    }

}
