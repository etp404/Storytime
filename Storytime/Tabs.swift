//
//  Tabs.swift
//  Storytime
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    let model = StubbedStorytimeModel()
    
    var body: some View {
        TabView {
            StoryListView(storyTimeModel: model)
                .tabItem {
                    Image(systemName: "sparkles")
            }
            
            MyStoriesView(storyTimeModel: model)
                .tabItem {
                    Image(systemName: "star.fill")
            }

            ComposeView(text: "")
                .tabItem {
                    Image(systemName: "square.and.pencil")
            }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
