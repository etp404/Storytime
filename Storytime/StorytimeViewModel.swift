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
    
    func stories(limit:Int) -> [StoryForView] {
        return self.model.stories()[..<limit].map {
            StoryForView(title:$0.title)
        }
    }
}
