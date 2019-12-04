//
//  FontView.swift
//  Project 4 Rosenlof Ross
//
//  Created by Ross on 12/3/19.
//  Copyright © 2019 Ross. All rights reserved.
//

import SwiftUI

struct FontView: View {
    @State private var fontAttribute = 0
    @State private var fontSize = 0.0
    var font: Font
    
    var body: some View {
        ScrollView {
            Text(font.full_name)
            VStack {
                Text("Attributes")
                Picker(selection: $fontAttribute, label: Text("Font Attribute")) {
                    Text("Normal").tag(0)
                    Text("Bold").tag(1)
                    Text("Italic").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
            }
            VStack {
                Slider(value: $fontSize)
            }
            
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)

        }
//        navigationBarTitle()
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView(font: fontModel[0])
    }
}
