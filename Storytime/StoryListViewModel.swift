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
        storiesInStack.removeAll { (story) -> Bool in
            story.storyId == id
        }
        model.dismissStory(id: id)
        let nextStory = model.nextStory()
        storiesInStack.append(StoryViewModel(storyId: nextStory.id, title: nextStory.title, index: storiesInStack.count))
    }
}
