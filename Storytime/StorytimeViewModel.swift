//
//  StorytimeViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StorytimeViewModel: NSObject {
    
    let model: StorytimeModel
    
    init(model:StorytimeModel) {
        self.model = model
    }
    
    func stories() -> [StoryForView] {
        return self.model.stories().map {
            StoryForView(title:$0.title)
        }
    }
    
    func xOffsetAsPercentageOfView(story:StoryForView) -> Double {
        return 0.0
    }
    
    func yOffsetAsPercentageOfView(story:StoryForView) -> Double {
        return 0.0
       }
}
