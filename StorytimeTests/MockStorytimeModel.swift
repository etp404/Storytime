//
//  MockStorytimeModel.swift
//  StorytimeTests
//
//  Created by Matthew Mould on 06/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit
@testable import Storytime

class MockStorytimeModel : StorytimeModel {
    func nextStory() -> Story {
        storyE
    }
    
    let storyA = Story(title:"A")
    let storyB = Story(title:"B")
    let storyC = Story(title:"C")
    let storyD = Story(title:"D")
    let storyE = Story(title:"E")
    let storyF = Story(title:"F")

    lazy var storyList = [storyA,
                          storyB,
                          storyC,
                          storyD,
                          storyE,
                          storyF]
    
    var dismissedStoryIds:[UUID] = []
    
    func stories() -> [Story] {
        return storyList
    }
    
    func dismissStory(id:UUID) {
        dismissedStoryIds.append(id)
        storyList.removeAll(where: {story in
            story.id == id
        })
        
    }
}
