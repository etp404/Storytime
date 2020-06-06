//
//  StorytimeViewNavigation.swift
//  Storytime
//
//  Created by Matthew Mould on 06/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct StorytimeViewNavigation {
    let storytimeModel:StorytimeModel
    
    func wholeStoryViewModel(id:UUID) -> WholeStoryViewModel {
        return WholeStoryViewModel(story: storytimeModel.story(id:id))
    }
}
