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
    
    @ObservedObject private var viewModel = StoryListViewModel(model:StubbedStorytimeModel(),numberOfCardInStack:6)
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    ForEach(self.viewModel.storiesInStack, id: \.self) {(story:StoryViewModel) in
                        Card(story:story) {
                            storyId in
                            self.viewModel.dismissStory(id: storyId)
                        }
                        .offset(x: CGFloat(-story.index * 5), y: CGFloat(-story.index * 10))
                        .zIndex(-Double(story.index))
                    }
                }
            }
        }
    }
}

struct Card : View {
    @State private var translation: CGSize = .zero
    private let onDismiss:(UUID)->Void
    private let story:StoryViewModel
    
    init(story:StoryViewModel, onDismiss: @escaping (UUID)->Void) {
        self.story = story
        self.onDismiss = onDismiss
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
                    .onChanged { gesture in
                        self.translation = gesture.translation
                }.onEnded { gesture in
                    if self.shouldDismiss(geometry, gesture: gesture) {
                        self.onDismiss(self.story.storyId)
                    } else {
                        self.translation = .zero
                    }
                }
            )
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

