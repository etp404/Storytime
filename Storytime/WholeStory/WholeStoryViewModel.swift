//
//  StorytimeModel2.swift
//  Storytime
//
//  Created by Matthew Mould on 09/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import Foundation

struct WholeStoryViewModel {
    
    let id:UUID
    let storyModel:StorytimeModel
    
    var title:String {
        get {
            storyModel.story(id: id).title
        }
    }
    
    var contentStrings: [String] {
        storyModel.story(id: id).contents.map{$0.body}
    }
}
