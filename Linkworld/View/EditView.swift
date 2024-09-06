//
//  EditView.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/5.
//

import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var model: Model
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                TitleInputView(title: $model.title)
                PlatformPicker(platformIcon: $model.platformIcon, platformName: $model.platformName)
                IndexURLView(indexURL: $model.indexURL)
                updateBtn()
                Spacer()
            }
            .navigationBarTitle("编辑身份卡", displayMode: .inline)
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

    func updateBtn() -> some View {
        Button(action: {
            // 更新后的数据会通过 @Binding 直接反映到 ContentView 中
            viewModel.editItem(item: model)  // 调用 ViewModel 的编辑方法
            self.presentationMode.wrappedValue.dismiss()  // 关闭编辑视图
        }) {
            Text("确定更新")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.horizontal)
        }
    }
}

#Preview {
    @State var previewModel = Model(platformIcon: "icon_juejin", title: "示例标题", platformName: "稀土掘金", indexURL: "https://example.com")
    
    return EditView(model: $previewModel, viewModel: ViewModel())
}

