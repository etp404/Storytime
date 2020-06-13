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
    
    private let storyTimeModel:StorytimeModel
    private let navigation:StorytimeViewNavigation
    @ObservedObject private var viewModel: StoryListViewModel
    
    init() {
        storyTimeModel = StubbedStorytimeModel()
        viewModel = StoryListViewModel(model:storyTimeModel, numberOfCardInStack:6, widthOfScreen: CGFloat(400))
        navigation = StorytimeViewNavigation(storytimeModel: storyTimeModel)
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    ForEach(self.viewModel.storiesInStack, id: \.storyId) {(story:StoryCardViewModel) in
                        Card(story:story,
                             navigation: self.navigation,
                             onSwipeComplete: {
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
                .navigationBarTitle(Text("Storytime"), displayMode: .inline)
            }
        }
    }
}

struct Card : View {
    private let navigation:StorytimeViewNavigation
    private let onSwipeComplete:(StoryCardViewModel)->Void
    @ObservedObject private var story:StoryCardViewModel
    private let textPadding:CGFloat = 15.0

    init(story:StoryCardViewModel,
         navigation:StorytimeViewNavigation,
         onSwipeComplete: @escaping (StoryCardViewModel)->Void) {
        self.story = story
        self.navigation = navigation
        self.onSwipeComplete = onSwipeComplete
    }
    
    var body: some View{
        GeometryReader { geometry in
            NavigationLink(destination: WholeStoryView(wholeStoryViewModel: self.navigation.wholeStoryViewModel(id: self.story.storyId))) {
                VStack {
                    Text(self.story.title)
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                        .padding(.leading, self.textPadding)
                        .padding(.trailing, self.textPadding)
                        .padding(.bottom, self.textPadding)
                        .padding(.top, 80)
                    Text(self.story.content)
                        .font(.system(size: 16, weight:.light, design: .serif))
                        .multilineTextAlignment(.leading)
                        .allowsTightening(true)
                        .padding(.leading, self.textPadding)
                        .padding(.trailing, self.textPadding)
                    Spacer()
                }
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
            }
        }
    }
}


struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}

