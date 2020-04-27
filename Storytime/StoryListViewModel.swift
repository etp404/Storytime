//
//  StorytimeViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StoryListViewModel: NSObject {
    
    private let model: StorytimeModel
    private let numberOfCardInStack:Int
    
    private (set) var storiesInStack:[StoryForView] 
    
    init(model:StorytimeModel,
         numberOfCardInStack:Int) {
        self.model = model
        self.numberOfCardInStack = numberOfCardInStack
        storiesInStack = self.model.stories()[..<numberOfCardInStack].map {
            StoryForView(storyId:$0.id, title:$0.title)
        }
    }
    
    func dismissStory(id:UUID) {
        storiesInStack.removeAll { (story) -> Bool in
            story.storyId == id
        }
        model.dismissStory(id: id)
        storiesInStack.append(model.nextStory().toStoryForView())
    }
}

extension Story {
    func toStoryForView() -> StoryForView {
        StoryForView(storyId:id, title: title)
    }
}
