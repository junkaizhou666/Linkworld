//
//  HomePageView.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/5.
//

import SwiftUI
import WebKit

struct HomePageView: View {
    
    var platformName: String
    var indexURL: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            SiteView(indexURL: indexURL)
                .navigationBarTitle(platformName, displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backBtn(), trailing: openWebBtn())
        }
    }
    
    // 返回按钮
    func backBtn() -> some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.down.circle.fill")
                .font(.system(size: 17))
                .foregroundColor(.black)
        }
    }
    
    // 打开浏览器按钮
    func openWebBtn() -> some View {
        // 尝试将 indexURL 构建为 URL 对象
        if let url = URL(string: "https://"+indexURL) {
            return Link(destination: url) {
                Image(systemName: "network")
                    .font(.system(size: 17))
                    .foregroundColor(.blue)
            }
        } else {
            // 处理无效 URL 的情况，提供一个默认链接或占位视图
            return Link(destination: URL(string: "https://www.baidu.com")!) {
                Image(systemName: "network")
                    .font(.system(size: 17))
                    .foregroundColor(.red)
            }
        }
    }
    
    // 预览
    struct HomePageView_Previews: PreviewProvider {
        static var previews: some View {
            HomePageView(platformName: "稀土掘金技术社区", indexURL: "juejin.cn/user/3897092103223517")
        }
    }
    
    struct SiteView: UIViewRepresentable {
        
        var indexURL: String
        
        // 创建 UIView
        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
        
        // 更新 UIView
        func updateUIView(_ uiView: WKWebView, context: Context) {
            // 安全解包 URL，避免崩溃
            if let url = URL(string: "https://" + indexURL) {
                let request = URLRequest(url: url)
                uiView.load(request)
            } else {
                // URL 无效的情况，可以提供默认行为或错误提示
                print("Invalid URL: \(indexURL)")
            }
        }
    }
}
