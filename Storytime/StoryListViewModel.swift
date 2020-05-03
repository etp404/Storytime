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
    
    private var modelStoryStack:[Story] = []
    
    var storiesInStack:[StoryForView] {
        get {
            return zip(modelStoryStack.indices, modelStoryStack)
                .map{ index, story in
                    StoryForView(storyId:story.id, title:story.title, index: index)
            }
        }
    }
    
    init(model:StorytimeModel,
         numberOfCardInStack:Int) {
        self.model = model
        self.numberOfCardInStack = numberOfCardInStack
        modelStoryStack = Array(self.model.stories().prefix(numberOfCardInStack))
    }
    
    func dismissStory(id:UUID) {
        modelStoryStack.removeAll { (story) -> Bool in
            story.id == id
        }
        model.dismissStory(id: id)
        modelStoryStack.append(model.nextStory())
    }
}
