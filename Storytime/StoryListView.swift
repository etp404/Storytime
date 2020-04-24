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
   
    let numberOfCardsToShow = 6
    
    var body: some View {
           NavigationView {
               ZStack {
                ForEach(storytimeViewModel.stories(limit:numberOfCardsToShow).indices) {index in
                    Card(story:self.storytimeViewModel.stories(limit:self.numberOfCardsToShow)[index])
                    .offset(x: CGFloat(index * 5), y: CGFloat(index * 10))
                }
               .offset(x: -CGFloat(numberOfCardsToShow/2 * 5), y: -CGFloat(numberOfCardsToShow/2 * 10))
           }
       }
    }
}

struct Card : View {
    let story:StoryForView
    
    init(story:StoryForView) {
        self.story = story
    }
    
    var body: some View{
        GeometryReader { geometry in
            VStack() {
                Text(self.story.title)
                    .font(.title)
                    .bold()
            }
            .padding(.horizontal)
            .frame(width:  geometry.size.width*0.8, height:  geometry.size.height*0.8, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}


struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}

