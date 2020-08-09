//
//  StoryView.swift
//  Storytime
//
//  Created by Matthew Mould on 09/05/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct WholeStoryView: View {

    private let wholeStoryViewModel:WholeStoryViewModel

    init(wholeStoryViewModel:WholeStoryViewModel) {
        UITableView.appearance().separatorColor = .clear
        self.wholeStoryViewModel = wholeStoryViewModel
    }

    var body: some View {
        GeometryReader { geometry in
            List {
                ForEach(self.wholeStoryViewModel.contentStrings, id: \.self) {section in
                    Text(section)
                        .frame(width:  geometry.size.width*0.8, height:  nil)
                        .padding(.all)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .navigationBarTitle(Text(self.wholeStoryViewModel.title), displayMode: .inline)
        }
    }
}
