//
//  ComposeView.swift
//  Storytime
//
//  Created by Matt Mould on 14/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct ComposeView: View {

    var viewModel: ComposeViewModel
    @State var text:String

    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all, 20)

                TextView(text: $text)
                    .cornerRadius(20)
                    .padding(.bottom, 20)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .shadow(radius: 5)

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Submit")
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle(Text("Start Your Story"), displayMode: .inline)
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView(viewModel: ComposeViewModel(model: StubbedStorytimeModel()), text:"Some story")
    }
}
