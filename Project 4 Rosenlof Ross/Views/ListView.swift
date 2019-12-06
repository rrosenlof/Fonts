//
//  ListView.swift
//  Project 4 Rosenlof Ross
//
//  Created by Ross on 12/3/19.
//  Copyright © 2019 Ross. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List(fontModel) { f in
                NavigationLink(destination: FontView(customFont: f)) {
                    RowView(customFont: f)
                }
            }.navigationBarTitle("Fonts")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
//        ListView()
        
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            ListView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
