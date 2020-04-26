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

    @State var viewModel = StoryListViewModel(model:StubbedStorytimeModel(),numberOfCardInStack:6)
    
    func stories() -> [StoryForView]{
        return self.viewModel.stories()
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    ForEach(self.stories().indices) {(index:Int) in
                        Card(story:self.stories()[index])
                            .offset(x: CGFloat(-index * 5), y: CGFloat(-index * 10))
                            .zIndex(-Double(index))
                    }
                }
            }
        }
    }
}

struct Card : View {
    @State var translation: CGSize = .zero

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
            .offset(x: self.translation.width, y: self.translation.height)
            .animation(.interactiveSpring())
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
               .onChanged { value in
                        self.translation = value.translation
                }
                .onEnded { value in
                    self.translation = .zero
                }
            )
        }
    }
}


struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
