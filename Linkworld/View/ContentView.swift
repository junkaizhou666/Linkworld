//
//  ContentView.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/4.
//

import SwiftUI

struct ContentView: View {
    @State var showNewView: Bool = false
    @ObservedObject var viewModel = ViewModel()  // 使用 @ObservedObject 观察 ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 246 / 255, green: 247 / 255, blue: 255 / 255)
                    .edgesIgnoringSafeArea(.all)
                List {
                    ForEach($viewModel.models) { $item in  // 使用 $ 传递 Binding<Model>
                        ZStack(alignment: .leading) {
                            CardView(
                                platformIcon: item.platformIcon,
                                title: item.title,
                                platformName: item.platformName,
                                indexURL: item.indexURL,
                                model: $item  // 传递 Binding<Model>
                            )
                            .contextMenu {
                                Button(action: {
                                    viewModel.deleteItem(itemId: item.id)
                                }) {
                                    Text("Delete")
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let item = viewModel.models[index]
                            viewModel.deleteItem(itemId: item.id)
                        }
                    }
                }
                .navigationTitle("Linkworld")
                .toolbar {
                    Button(action: {
                        showNewView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showNewView) {
                    NewView(viewModel: viewModel)  // 确保 NewView 传递 viewModel
                }
            }
        }
    }
}

struct CardView: View {
    var platformIcon: String
    var title: String
    var platformName: String
    var indexURL: String
    @Binding var model: Model
    
    @State var showHomePageView: Bool = false
    @State var showEditView: Bool = false
    
    var body: some View {
        HStack {
            HStack {
                Image(platformIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 48, maxHeight: 48)
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Text(platformName)
                        .font(.system(size: 14))
                }
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.showHomePageView.toggle()
            }

            Image(systemName: "ellipsis")
                .padding()
                .foregroundColor(.black)
                .gesture(
                    TapGesture()
                        .onEnded({
                            self.showEditView.toggle()
                        })
                )
        }
        .padding()
        .frame(maxHeight: 80)
        .background(.white)
        .cornerRadius(8)
        .sheet(isPresented: self.$showEditView) {
            EditView(model: $model, viewModel: ViewModel())
        }
        .fullScreenCover(isPresented: $showHomePageView) {
            HomePageView(platformName: platformName, indexURL: indexURL)
                .edgesIgnoringSafeArea(.all)
        }
    }
}



#Preview {
    ContentView()
}
