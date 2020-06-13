//
//  MyStoriesView.swift
//  Storytime
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct MyStoriesView: View {
    
    let viewModel: MyStoriesViewModel
    
    init() {
        let storyTimeModel = StubbedStorytimeModel()
        viewModel = MyStoriesViewModel(model:storyTimeModel)
    }
    
    var body: some View {
        List {
            ForEach(viewModel.titles, id: \.self) {title in
                Text(title)
            }
        }
    }
}


