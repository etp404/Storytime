//
//  WholeStoryViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 06/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct WholeStoryViewModel {
    let story:Story
    
    var title:String {
        get {
            story.title
        }
    }
}
