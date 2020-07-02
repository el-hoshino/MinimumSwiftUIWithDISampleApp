//
//  SummaryCell.swift
//  iOS
//
//  Created by 史 翔新 on 2020/07/03.
//

import SwiftUI

struct SummaryCell: View {
    
    let title: String
    let content: String
    
    var body: some View {
        HStack {
            Text("\(title)")
            Spacer()
            Text("\(content)")
                .font(.subheadline)
        }
    }
    
}

struct SummaryCell_Previews: PreviewProvider {
    
    static let title = "Title"
    static let content = "Content"
    
    static var previews: some View {
        Group {
            SummaryCell(title: title, content: content)
            SummaryCell(title: title, content: content)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
