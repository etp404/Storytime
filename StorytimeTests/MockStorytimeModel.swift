//
//  MockStorytimeModel.swift
//  StorytimeTests
//
//  Created by Matthew Mould on 06/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit
@testable import Storytime

class MockStorytimeModel {
    
    let storyA = Story(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!,
                       title:"Title A",
                       contents: [StorySection(id: UUID(),
                                               body: "Section A1"),
                                  StorySection(id: UUID(),
                                               body: "Section A2")])
    let storyB = Story(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5D")!,
                       title:"Title B",
                       contents: [StorySection(id: UUID(),
                                               body: "Section B1"),
                                  StorySection(id: UUID(),
                                               body: "Section B2")])
    let storyC = Story(title:"C")
    let storyD = Story(title:"D")
    let storyE = Story(title:"E")
    let storyF = Story(title:"F")
    
    let myStoryA = Story(title:"MyStoryA")
    let myStoryB = Story(title:"MyStoryB")
    let myStoryC = Story(title:"MyStoryC")
    
    init() {
       myStoriesInternal = [myStoryA, myStoryB, myStoryC]
    }
    
    var myStoriesInternal:[Story] {
        didSet {
            myStoriesChanged?()
        }
    }
    
    func addStoryToMyStoriesAndNotify() {
        myStoriesInternal.append(Story(title:"MyStoryD"))
    }
    
    lazy var storiesById:[UUID:Story] = [
        storyA.id: storyA,
        storyB.id: storyB,
        storyC.id: storyC,
        storyD.id: storyD,
        storyE.id: storyE,
        storyF.id: storyF
    ]
    
    lazy var storyList = [
        storyA,
        storyB,
        storyC,
        storyD,
        storyE,
        storyF]
    
    var dismissedStoryIds:[UUID] = []
    var savedStories:[UUID] = []
    var internalMyStoriesChangedCallback: (() -> Void)?
    
}

extension MockStorytimeModel : StorytimeModel {
    var myStoriesChanged: (() -> Void)? {
        get {
            internalMyStoriesChangedCallback
        }
        set(newValue) {
            internalMyStoriesChangedCallback = newValue
        }
    }
    
    
    func likeStory(id: UUID) {
        savedStories.append(id)
    }
    
    func story(id: UUID) -> Story {
        return storiesById[id]!
    }
    
    func nextStory() -> Story {
        storyE
    }
    
    func stories() -> [Story] {
        return storyList
    }
    
    func dismissStory(id:UUID) {
        dismissedStoryIds.append(id)
        storyList.removeAll(where: {story in
            story.id == id
        })
    }
    
    var myStories: [Story] {
        get {
            return myStoriesInternal
        }
    }
    
}
