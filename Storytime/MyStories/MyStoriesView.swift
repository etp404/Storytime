//
//  MyStoriesView.swift
//  Storytime
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct MyStoriesView: View {
    
    private let viewModel: MyStoriesViewModel
    private let navigation:StorytimeViewNavigation

    init(storyTimeModel: StorytimeModel) {
        viewModel = MyStoriesViewModel(model:storyTimeModel)
        navigation = StorytimeViewNavigation(storytimeModel: storyTimeModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.myStories, id: \.id) {story in
                    NavigationLink(destination: WholeStoryView(wholeStoryViewModel: self.navigation.wholeStoryViewModel(id: story.id))) {
                        Text(story.title)
                    }
                }
            }
            .navigationBarTitle(Text("My Stories"), displayMode: .inline)
        }
    }
}


