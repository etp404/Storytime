//
//  StubbedStorytimeModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StubbedStorytimeModel: StorytimeModel {
    func submitStory(story: Story) {
        allStories.append(story)
        myStoryIds.append(story.id)
    }

    var myStoriesChanged: (() -> Void)?
    
    
    var myStories: [Story] {
        get {
            myStoryIds.map{ id in
                allStories.first(where: { story in
                    story.id == id
                }) ?? Story(title:"Unknown")
            }
        }
    }
    
    var myStoryIds = [UUID]() {
        didSet {
            myStoriesChanged?()
        }
    }
    
    private let storiesAtStary = [
        Story(title:"101 Dalmations",
              contents: [StorySection(id:UUID(), body:"‘Ladies and gentlemen,’ she said, dramatically, ‘puppies are arriving earlier than expected. Mr and Mrs Dearly ask you to remember that Missis has never before been a mother. She needs absolute quiet.’"),
                         StorySection(id:UUID(), body:"There was an instant silence, broken only by a stifled sneeze. Then the guests rose, drank a whispered toast to the young mother, and tiptoed from the house."),
                         StorySection(id:UUID(), body:"All except Cruella de Vil. When she reached the hall she went straight to Nanny Butler, who was seeing the guests out, and demanded:‘Where are those puppies?’")]),
        Story(title:"Story B"),
        Story(title:"Story C"),
        Story(title:"Story D"),
        Story(title:"Story E"),
        Story(title:"Story F"),
        Story(title:"Story G"),
        Story(title:"Story H"),
        Story(title:"Story I"),
        Story(title:"Story J"),
        Story(title:"Story K"),
        Story(title:"Story L"),
        Story(title:"Story M"),
        Story(title:"Story N"),
        Story(title:"Story O")]
    
    lazy private var allStories = storiesAtStary
    
    lazy private var storyList = storiesAtStary
    
    func stories() -> [Story] {
        return storyList
    }
    
    func story(id: UUID) -> Story {
        return allStories.first(where: {story in
            story.id == id
        }) ?? Story(title: "")
    }
    
    func dismissStory(id: UUID) {
        storyList.removeAll(where: {story in
            story.id == id
        })
    }
    
    func likeStory(id: UUID) {
        myStoryIds.append(id)
    }
    
    
    func nextStory() -> Story {
        Story(title:"Story P")
    }

}
