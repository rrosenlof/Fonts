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
    @State private var customText = ""
    @State  var isDark = false
    
    var customFont: CustomFont
    var minFontSize: CGFloat = 12.0
    var maxFontSize: CGFloat = 72.0
    
    
    var body: some View {
        VStack {
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
            
            HStack {
                Text("Enter Your Text Here:")
                    .fontWeight(.ultraLight)
                Spacer()
            }
                
            TextView(text: $customText, fontName: customFont.ttf_name, fontSize: fontSize, isDarkMode: isDark)
            
            
            Spacer()
        }
        .padding()
        
        .navigationBarTitle(Text(customFont.full_name), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.isDark = !self.isDark
            }, label: {
                Text(self.isDark ? "Light" : "Dark")
            })
        )
    }
        
    
}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    var fontName: String
    var fontSize: CGFloat
    var isDarkMode: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {

        let myTextView = UITextView()
        myTextView.delegate = context.coordinator

        myTextView.font = UIFont(name: "\(fontName)", size: fontSize)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
//        if (isDarkMode) {
//            myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.97)
//            myTextView.textColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 0.9)
//        } else {
//            myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.03)
//            myTextView.textColor = UIColor(hue: 0, saturation: 1, brightness: 0, alpha: 0.8)
//        }
        
        return myTextView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont(name: "\(fontName)", size: fontSize)
        if (isDarkMode) {
            uiView.backgroundColor = UIColor(white: 0.0, alpha: 0.97)
            uiView.textColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 0.9)
        } else {
            uiView.backgroundColor = UIColor(white: 0.0, alpha: 0.03)
            uiView.textColor = UIColor(hue: 0, saturation: 1, brightness: 0, alpha: 0.8)
        }
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: TextView

        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView(customFont: fontModel[4])
    }
}
