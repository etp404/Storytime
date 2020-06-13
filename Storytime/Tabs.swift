//
//  Tabs.swift
//  Storytime
//
//  Created by Matthew Mould on 13/06/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            StoryListView()
                .tabItem {
                    Image(systemName: "sparkles")
            }
            
            MyStoriesView()
                .tabItem {
                    Image(systemName: "star.fill")
            }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
