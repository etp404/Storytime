//
//  StoryForView.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct StoryViewModel : Hashable {
    let storyId:UUID
    let title:String
    let index:Int
    var xTranslation:Int = 0
}
