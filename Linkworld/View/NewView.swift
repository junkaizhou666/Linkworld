//
//  EditView.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/5.
//

import SwiftUI

struct NewView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var platformIcon: String = "icon_juejin"
    @State var title: String = ""
    @State var platformName: String = "稀土掘金技术社区"
    @State var indexURL: String = ""

    let platforms = [
        ("稀土掘金技术社区", "icon_juejin"),
        ("CSDN博客", "icon_csdn"),
        ("阿里云社区", "icon_aliyun"),
        ("华为云社区", "icon_huaweiyun"),
    ]
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var selectedItem = 0
    
    // 使用 @ObservedObject 传递的 ViewModel
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                TitleInputView(title: $title)
                PlatformPicker(platformIcon: $platformIcon, platformName: $platformName)
                IndexURLView(indexURL: $indexURL)
                addBtn()
                Spacer()
            }
            .navigationBarTitle("添加身份卡", displayMode: .inline)
            .navigationBarItems(trailing: closeBtn())
        }
    }
    
    func closeBtn() -> some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 17))
                .foregroundColor(.gray)
        }
    }
    
    func addBtn() -> some View {
        Button(action: {
            let newItem = Model(platformIcon: platformIcon, title: title, platformName: platformName, indexURL: indexURL)
            self.viewModel.addCard(newItem: newItem)  // 调用 ViewModel 的 addCard 方法
            
            self.presentationMode.wrappedValue.dismiss()  // 添加完成后关闭视图
        }) {
            Text("添加")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(8)
                .padding(.horizontal)
        }
    }
}

// 预览代码时，需要传递一个示例的 ViewModel
#Preview {
    NewView(viewModel: ViewModel())
}
