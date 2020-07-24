//
//  StoryForView.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct StorySectionViewModel {
    let id: UUID
    let body:String
}

class StoryCardViewModel : NSObject, ObservableObject {
    let storyId:UUID
    let title:String
    let index:Int
    let content:String
    let contents:[StorySectionViewModel]
    @Published var translation:CGSize
    
    init(storyId:UUID,
         title:String,
         index:Int,
         translation:CGSize = CGSize(width:0.0, height:0.0),
         content:String = "",
         contents:[StorySectionViewModel] = [StorySectionViewModel(id : UUID(), body:"")]) {
        self.storyId = storyId
        self.title = title
        self.index = index
        self.translation = translation
        self.content = content
        self.contents = contents
    }
}
