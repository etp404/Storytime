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
    var widthOfScreen:CGFloat
    @Published var storiesInStack:[StoryCardViewModel] = []
    
    init(model:StorytimeModel,
         numberOfCardInStack:Int,
         widthOfScreen:CGFloat) {
        self.model = model
        self.numberOfCardInStack = numberOfCardInStack
        self.widthOfScreen = widthOfScreen
        super.init()
        updateStoriesInStack()
    }

    func swipeComplete(on story:StoryCardViewModel) {
        if shouldDimiss(story) {
            model.dismissStory(id: story.storyId)
        }
        updateStoriesInStack()
        model.likeStory(id: story.storyId)
    }
    
    private func shouldDimiss(_ story: StoryCardViewModel) -> Bool {
        return story.index == 0 && story.translation.width > widthOfScreen/2
    }
    
    private func updateStoriesInStack() {
        let storiesToShow = self.model.stories().prefix(numberOfCardInStack)
        storiesInStack = zip(storiesToShow.indices, storiesToShow)
            .map{ index, story in
                StoryCardViewModel(storyId:story.id, title:story.title, index: index, content: story.content[0])
        }
    }
}
