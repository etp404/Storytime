//
//  ComposeView.swift
//  Storytime
//
//  Created by Matt Mould on 14/08/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import SwiftUI

struct ComposeView: View {

    @State var story: String = ""

    var body: some View {
        TextField("Compose story...", text:$story)
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
    }
}
