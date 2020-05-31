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
    
    @ObservedObject private var viewModel: StoryListViewModel
    
    init() {
        viewModel = StoryListViewModel(model:StubbedStorytimeModel(),numberOfCardInStack:6, widthOfScreen: CGFloat(400))
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    ForEach(self.viewModel.storiesInStack, id: \.storyId) {(story:StoryCardViewModel) in
                        Card(story:story, onSwipeComplete: {
                            storyId in
                            self.viewModel.swipeComplete(on: story)
                        })
                        .buttonStyle(PlainButtonStyle())
                        .animation(.spring())
                        .offset(x: CGFloat(-story.index * 5), y: CGFloat(-story.index * 10))
                        .zIndex(-Double(story.index))
                    }
                }.onAppear(perform: {
                    self.viewModel.widthOfScreen = CGFloat(geometry.size.width)
                })
                
            }
        }
    }
}

struct Card : View {
    private let onSwipeComplete:(StoryCardViewModel)->Void
    @ObservedObject private var story:StoryCardViewModel
    
    init(story:StoryCardViewModel, onSwipeComplete: @escaping (StoryCardViewModel)->Void) {
        self.story = story
        self.onSwipeComplete = onSwipeComplete
    }
    
    var body: some View{
        GeometryReader { geometry in
            NavigationLink(destination: WholeStoryView()) {
                Text(self.story.title)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .frame(width:  geometry.size.width*0.8, height:  geometry.size.height*0.8, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .offset(x: self.story.translation.width, y: self.story.translation.height)
                    .animation(.interactiveSpring())
                    .rotationEffect(.degrees(Double(self.story.translation.width / geometry.size.width) * 25), anchor: .bottom)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.story.translation = gesture.translation
                        }.onEnded { gesture in
                            self.onSwipeComplete(self.story)
                        }
                )
                    .accessibility(label: Text(self.story.title))
            }
        }
    }
    
    private func shouldDismiss(_ geometry: GeometryProxy, gesture: DragGesture.Value) -> Bool {
        abs(gesture.translation.width / geometry.size.width) > 0.5
    }
}


struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}

