//
//  ComposeView.swift
//  Storytime
//
//  Created by Matt Mould on 14/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct ComposeView: View {

    @State var text:String

    var body: some View {
        NavigationView {
            VStack {
                TextView(text: $text)
                    .cornerRadius(20)
                    .padding(.all, 20)
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
        ComposeView(text:"Some story")
    }
}
