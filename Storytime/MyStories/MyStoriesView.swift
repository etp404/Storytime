//
//  MyStoriesView.swift
//  Storytime
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct MyStoriesView: View {
    
    @ObservedObject private var viewModel: MyStoriesViewModel
    private let storyTimeModel: StorytimeModel
    
    init(storyTimeModel: StorytimeModel) {
        viewModel = MyStoriesViewModel(model:storyTimeModel)
        self.storyTimeModel = storyTimeModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.myStories, id: \.id) {story in
                    NavigationLink(destination: WholeStoryView(wholeStoryViewModel: WholeStoryViewModel(id: story.id, storyModel: self.storyTimeModel))) {
                        Text(story.title)
                    }
                }
            }
            .navigationBarTitle(Text("My Stories"), displayMode: .inline)
        }
    }
}


