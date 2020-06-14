//
//  StorytimeModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

protocol StorytimeModel {
    func stories() -> [Story]
    var myStories: [Story] {get}
    func story(id:UUID) -> Story
    func dismissStory(id:UUID)
    func likeStory(id:UUID)
    func nextStory()->Story
    var myStoriesChanged:(()->Void)? {get set}
}
