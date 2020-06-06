//
//  StoryView.swift
//  Storytime
//
//  Created by Matthew Mould on 09/05/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct WholeStoryView: View {

    let wholeStoryViewModel:WholeStoryViewModel
    
    var body: some View {
        Text("")
        .navigationBarTitle(Text(wholeStoryViewModel.title), displayMode: .inline)
    }
}

struct WholeStoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        WholeStoryView(wholeStoryViewModel: WholeStoryViewModel(story:Story(title:"A title")))
    }
}
