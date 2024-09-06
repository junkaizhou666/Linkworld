//
//  IndexURLView.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/5.
//

import SwiftUI

struct IndexURLView: View {
    @Binding var indexURL: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $indexURL)
                .font(.system(size: 17))
                .padding(15)
            
            if indexURL.isEmpty {
                Text("请输入主页链接")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(20)
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding()
        .frame(maxHeight: 240)
    }
}

#Preview {
    IndexURLView(indexURL: .constant(""))
}
