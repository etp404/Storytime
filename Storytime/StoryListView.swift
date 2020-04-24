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
                    GeometryReader { geometry in
                        VStack() {
                            Text(story.title)
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
       }
    }
}


struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}

