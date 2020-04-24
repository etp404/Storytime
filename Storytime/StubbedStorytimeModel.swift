//
//  StubbedStorytimeModel.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

class StubbedStorytimeModel: StorytimeModel {
    func stories() -> [Story] {
        return [
            Story(title:"Story A"),
            Story(title:"Story B"),
            Story(title:"Story C")]
    }

}
