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
    let contents:[StorySectionViewModel]
    @Published var translation:CGSize
    var width:CGFloat?
    
    init(storyId:UUID,
         title:String,
         index:Int,
         translation:CGSize = CGSize(width:0.0, height:0.0),
         contents:[StorySectionViewModel] = [StorySectionViewModel(id : UUID(), body:"")]) {
        self.storyId = storyId
        self.title = title
        self.index = index
        self.translation = translation
        self.contents = contents
    }
}
