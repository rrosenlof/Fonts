//
//  RowView.swift
//  Project 4 Rosenlof Ross
//
//  Created by Ross on 12/3/19.
//  Copyright © 2019 Ross. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var font: Font
    
    var body: some View {
        HStack {
            Text(font.full_name)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(font: fontModel[0])
    }
}
