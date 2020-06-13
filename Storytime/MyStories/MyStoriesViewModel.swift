//
//  MyStoriesViewModel.swift
//  Storytime
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct MyStoriesViewModel {
    let storytimeModel:StorytimeModel
    var titles:[String] {
        get {
            storytimeModel.myStories().map{$0.title}
        }
    }
    
    init(model:StorytimeModel) {
        self.storytimeModel = model
    }
}
