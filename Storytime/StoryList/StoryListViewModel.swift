//
//  StorytimeViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit
import Combine

class StoryListViewModel: NSObject, ObservableObject{
    
    private let model: StorytimeModel
    private let numberOfCardInStack:Int
    var widthOfScreen:CGFloat
    @Published var storiesInStack:[StoryCardViewModel] = []
    var overlayText = ""
    @Published var overlayOpacity = 0.0
    @Published var overlayTranslation = CGFloat(0.0)
    var cancellable:AnyCancellable?
    
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
        if shouldLike(story) {
            model.likeStory(id: story.storyId)
        }
    }
    
    private func shouldDimiss(_ story: StoryCardViewModel) -> Bool {
        return story.index == 0 && abs(story.translation.width) > widthOfScreen/2
    }
    
    private func shouldLike(_ story: StoryCardViewModel) -> Bool {
        return shouldDimiss(story) && story.translation.width > 0
    }
    
    private func updateStoriesInStack() {
        let storiesToShow = self.model.stories().prefix(numberOfCardInStack)
        storiesInStack = zip(storiesToShow.indices, storiesToShow)
            .map{ index, story in
                StoryCardViewModel(storyId:story.id,
                                   title:story.title,
                                   index: index,
                                   contents: story.contents.map{
                                    StorySectionViewModel(id: $0.id, body: $0.body)
                })
        }
        cancellable = storiesInStack.first?.$translation.sink() {[weak self] translation in
            guard let widthOfScreen = self?.widthOfScreen else { return }
            self?.overlayOpacity = Double(abs(translation.width))*2/Double(widthOfScreen)
            print(translation.width/widthOfScreen)
            if translation.width >= 0 {
                self?.overlayText = "Save"
                self?.overlayTranslation = widthOfScreen - translation.width
            } else {
                self?.overlayText = "Dismiss"
                guard let cardWidth = self?.storiesInStack.first?.width else { return }
                self?.overlayTranslation = abs(translation.width)-cardWidth
            }
        }
    }
}
