//
//  StorytimeModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

protocol StorytimeModel {

    var myStoriesChanged:(()->Void)? {get set}
    var myStories: [Story] {get}

    func stories() -> [Story]
    func story(id:UUID) -> Story
    func dismissStory(id:UUID)
    func likeStory(id:UUID)
    func nextStory()->Story
    func submitStory(story:Story)
}
