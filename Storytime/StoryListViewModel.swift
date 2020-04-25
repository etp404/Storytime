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
    
    init(model:StorytimeModel,
         numberOfCardInStack:Int) {
        self.model = model
        self.numberOfCardInStack = numberOfCardInStack
    }
    
    func stories() -> [StoryForView] {
        return self.model.stories()[..<numberOfCardInStack].map {
            StoryForView(title:$0.title)
        }
    }
}
