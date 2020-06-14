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

class MyStoriesViewModel {
    var storytimeModel:StorytimeModel
    var myStories:[MyStoriesStoryVM]
    
    init(model:StorytimeModel) {
        self.storytimeModel = model
        myStories = storytimeModel.myStories.map {
            MyStoriesStoryVM(story: $0)
        }
        self.storytimeModel.myStoriesChanged = {
            self.myStories = self.storytimeModel.myStories.map {
                MyStoriesStoryVM(story: $0)
            }
        }
    }
    
}
