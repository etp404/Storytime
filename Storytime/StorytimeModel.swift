//
//  StorytimeModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

protocol StorytimeModel {
    func stories() -> [Story]
    
    func dismissStory(id:UUID)
    func nextStory()->Story

}
