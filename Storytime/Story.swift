//
//  Story.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct StorySection {
    let id:UUID
    let body:String
}

struct Story {
    let id:UUID
    let title:String
    let content:[String]
    let contents:[StorySection]
    
    init(id:UUID = UUID(),
         title:String,
         content:[String] = ["Section 1", "Section 2"],
         contents:[StorySection] = [StorySection(id:UUID(), body: "")]) {
        self.id = id
        self.title = title
        self.content = ["", ""]
        self.contents = contents
    }
}
