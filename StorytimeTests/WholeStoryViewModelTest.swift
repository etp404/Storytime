//
//  WholeStoryViewModelTest.swift
//  StorytimeTests
//
//  Created by Matthew Mould on 06/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import XCTest
@testable import Storytime

class WholeStoryViewModelTest: XCTestCase {

    var woleStoryViewModel:WholeStoryViewModel!
    var story:Story!
    
    override func setUp() {
        self.continueAfterFailure = true;
        story = Story(title: "Some Story", content:["Some content 1", "Some content 2"])
        woleStoryViewModel = WholeStoryViewModel(story: story)
    }
    
    func testTitleIsSet() {
        XCTAssertEqual(woleStoryViewModel.title, story.title)
        
    }


}
