//
//  StoryListView.swift
//  Storytime
//
//  Created by Matthew Mould on 24/04/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit
import SwiftUI

struct StoryListView: View {

    @State var storytimeViewModel = StorytimeViewModel(model:StubbedStorytimeModel())
   
    var body: some View {
           NavigationView {
               ZStack {
                ForEach(storytimeViewModel.stories(), id: \.self) {story in
                    Text(story.title)
                }
           }
       }
    }
}


struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}

