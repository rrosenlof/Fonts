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
    
    var minFontSize: CGFloat = 12.0
    var maxFontSize: CGFloat = 72.0
    
    var body: some View {
        VStack {
            
//                VStack(alignment: .leading) {
//                    Text("Attributes:")
//                        .fontWeight(.ultraLight)
//                    Picker(selection: $fontAttribute, label: Text("Font Attribute")) {
//                        Text("Normal").tag(0)
//                        Text("Bold").bold().tag(1)
//                        Text("Italic").italic().tag(2)
//                    }.pickerStyle(SegmentedPickerStyle())
//                }
            
            HStack {
                VStack(alignment: .leading) {
                    Text(customFont.full_name)
                        .font(.custom("\(customFont.ttf_name)", size: 32))
                    Text("Font Size: \(Int(fontSize))px")
                        .fontWeight(.ultraLight)
                    HStack {
                        Text("\(Int(minFontSize))")
                        Slider(value: $fontSize, in: minFontSize...maxFontSize, step: 1)
                        Text("\(Int(maxFontSize))")
                    }
                }
                Text((customFont.full_name.prefix(1)))
                .font(.custom("\(customFont.ttf_name)", size: 72))
                    .padding(.trailing, -10)
                Text((customFont.full_name.prefix(1).lowercased()))
                .font(.custom("\(customFont.ttf_name)", size: 72))
            }
            
            
            TextField("Enter Your Text Here", text: $customText)
                .font(.custom("\(customFont.ttf_name)", size: fontSize))
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
                .lineLimit(nil)
            
            
            
            Spacer()
            }
        .padding()
        
        .navigationBarTitle(Text(customFont.full_name), displayMode: .inline)
    }
        
    
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView(customFont: fontModel[4])
    }
}
