//
//  PlatformPicker.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/5.
//

import SwiftUI

struct PlatformPicker: View {
    
    @Binding var platformIcon: String
    @Binding var platformName: String
    
    let platforms = [
            ("稀土掘金技术社区", "icon_juejin"),
            ("CSDN博客", "icon_csdn"),
            ("阿里云社区", "icon_aliyun"),
            ("华为云社区", "icon_huaweiyun"),
        ]
        var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 10) {
                ForEach(platforms.indices, id: \.self) { item in
                    if platforms[item].0 == platformName {
                        Image(platforms[item].1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.green, lineWidth: 4)
                            )
                    } else {
                        Image(platforms[item].1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .onTapGesture {
                                platformIcon = platforms[item].1
                                platformName = platforms[item].0
                        }
                    }

                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
    
}

#Preview {
    PlatformPicker(platformIcon: .constant("icon_juejin"), platformName: .constant("稀土掘金技术社区"))
}
