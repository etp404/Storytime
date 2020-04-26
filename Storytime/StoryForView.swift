//
//  StoryForView.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct StoryForView : Hashable {
    let storyId:UUID
    let title:String
    
    init(storyId:UUID, title:String) {
        self.storyId = storyId
        self.title = title
    }

}
