//
//  MyStoriesViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct MyStoriesStoryVM {
    let id:UUID
    let title:String
    
    init(story:Story) {
        id = story.id
        title = story.title
    }
}

struct MyStoriesViewModel {
    let storytimeModel:StorytimeModel
    var myStories:[MyStoriesStoryVM] {
        get {
            storytimeModel.myStories().map {
                MyStoriesStoryVM(story: $0)
            }
        }
    }
    
    init(model:StorytimeModel) {
        self.storytimeModel = model
    }
}
