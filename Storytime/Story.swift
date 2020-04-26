//
//  Story.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct Story {
    let id:UUID
    let title:String
    
    init(title:String) {
        self.id = UUID.init()
        self.title = title
    }
}