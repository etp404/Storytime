//
//  StorytimeViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StoryListViewModel: NSObject {
    
    let model: StorytimeModel
    let numberOfCardInStack:Int
    
    var storiesInStack:[StoryForView];
    
    init(model:StorytimeModel,
         numberOfCardInStack:Int) {
        self.model = model
        self.numberOfCardInStack = numberOfCardInStack
        storiesInStack = self.model.stories()[..<numberOfCardInStack].map {
            StoryForView(storyId:$0.id, title:$0.title)
        }
    }
    
    func stories() -> [StoryForView] {
        return storiesInStack
    }
    
    func dismissStory(id:UUID) {
        storiesInStack.removeAll { (story) -> Bool in
            story.storyId == id
        }
    }
}
