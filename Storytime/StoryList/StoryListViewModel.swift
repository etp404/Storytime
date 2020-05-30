//
//  StorytimeViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StoryListViewModel: NSObject, ObservableObject{
    
    private let model: StorytimeModel
    private let numberOfCardInStack:Int
    
    @Published var storiesInStack:[StoryViewModel] = []
    
    init(model:StorytimeModel,
         numberOfCardInStack:Int) {
        self.model = model
        self.numberOfCardInStack = numberOfCardInStack
        
        let storiesToShow = self.model.stories().prefix(numberOfCardInStack)
        storiesInStack = zip(storiesToShow.indices, storiesToShow)
            .map{ index, story in
                StoryViewModel(storyId:story.id, title:story.title, index: index)
        }
    }
    
    func dismissStory(id:UUID) {
        if storiesInStack[0].storyId != id { return }
        var newStoriesInStack = Array(storiesInStack.dropFirst())
        let nextStory = model.nextStory()
        newStoriesInStack.append(StoryViewModel(storyId: nextStory.id, title: nextStory.title, index: storiesInStack.count))
        storiesInStack = zip(newStoriesInStack.indices, newStoriesInStack).map{ index, story in
            StoryViewModel(storyId:story.storyId, title:story.title, index:index)
        }
        model.dismissStory(id: id)
    }
}
