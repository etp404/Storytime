//
//  ComposeViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 16/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class ComposeViewModel : ObservableObject {
    let model: StorytimeModel
    let buttonTitle = "Submit"
    var storyTitle:String = ""
    var storyBody:String = ""
    
    init(model: StorytimeModel) {
        self.model = model
    }
    
    func submitPressed() {
        model.submitStory(story: Story(id: UUID(), title: storyTitle, contents: [StorySection(id: UUID(), body: storyBody)]))
    }
    
}
