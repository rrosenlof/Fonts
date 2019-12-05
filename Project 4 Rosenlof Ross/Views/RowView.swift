//
//  RowView.swift
//  Project 4 Rosenlof Ross
//
//  Created by Ross on 12/3/19.
//  Copyright © 2019 Ross. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var customFont: CustomFont
    
    var body: some View {
        HStack {
            Text(customFont.full_name)
                .font(.custom(customFont.ttf_name, size: 18))
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(customFont: fontModel[0])
    }
}
