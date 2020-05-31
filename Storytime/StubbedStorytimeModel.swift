//
//  StubbedStorytimeModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StubbedStorytimeModel: StorytimeModel {
    
    private var storyList = [
        Story(title:"Story A"),
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
    
    func stories() -> [Story] {
        return storyList
    }
    
    func dismissStory(id: UUID) {
        storyList.removeAll(where: {story in
            story.id == id
        })
    }
    
    func nextStory() -> Story {
        Story(title:"Story P")
    }

}
