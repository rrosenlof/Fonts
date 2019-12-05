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
    @State private var fontSize: CGFloat = 16.0
    var customFont: CustomFont
    @State private var customText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(customFont.full_name)
                    .font(.custom("\(customFont.ttf_name)", size: 32))
                VStack(alignment: .leading) {
                    Text("Attributes:")
                    Picker(selection: $fontAttribute, label: Text("Font Attribute")) {
                        Text("Normal").tag(0)
                        Text("Bold").tag(1)
                        Text("Italic").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                VStack(alignment: .leading) {
                    Text("Font Size:")
                    Slider(value: $fontSize)
                }
                
                TextField("Your Text Here", text: $customText)
                    .font(.custom("\(customFont.ttf_name)", size: fontSize))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
        }
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView(customFont: fontModel[4])
    }
}
