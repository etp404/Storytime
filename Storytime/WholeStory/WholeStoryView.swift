//
//  StoryView.swift
//  Storytime
//
//  Created by Matthew Mould on 09/05/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct WholeStoryView: View {
    let viewModel:WholeStoryViewModel
    
    var body: some View {
        Text("WholeStory")
    }
}

struct WholeStoryView_Previews: PreviewProvider {
    static var previews: some View {
        WholeStoryView(viewModel:WholeStoryViewModel(story:Story(title:"It's the title",
                                                       content:["It's the first paragraph",
                                                                "It's the second paragraph"])))
    }
}
