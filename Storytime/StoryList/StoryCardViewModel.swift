//
//  StoryForView.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StoryCardViewModel : NSObject, ObservableObject {
    let storyId:UUID
    let title:String
    let index:Int
    var xTranslation:Int 
    
    init(storyId:UUID,
         title:String,
         index:Int,
         xTranslation:Int = 0) {
        self.storyId = storyId
        self.title = title
        self.index = index
        self.xTranslation = xTranslation
    }
}
