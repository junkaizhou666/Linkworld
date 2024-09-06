//
//  ViewModel.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/5.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var models = [Model]()
    
    private let jsonURL = "https://api.npoint.io/ae928a66a059125e60b1"
    
    init() {
        loadItems()
        getData() // 确保在初始化时也会从网络加载数据
    }
    
    // 网络请求
    func getData() {
        guard let url = URL(string: jsonURL) else {
            print("无效的 URL")
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                print("获取数据时出错: \(error)")
                return
            }
            
            guard let data = data else {
                print("未找到数据")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Model].self, from: data)
                DispatchQueue.main.async {
                    self?.models = decodedData
                }
            } catch {
                print("解析数据时出错: \(error)")
            }
        }
        .resume()
    }
    
    // 创建身份卡
    func addCard(newItem: Model) {
        models.append(newItem)
        saveItems()
    }
    
    // 删除身份卡
    func deleteItem(itemId: UUID) {
        models.removeAll { $0.id == itemId }
        saveItems()
    }
    
    // 编辑更新数据项
    func editItem(item: Model) {
        if let index = models.firstIndex(where: { $0.id == item.id }) {
            models[index] = item
            saveItems()
        }
    }

    
    // 获取设备上的文档目录路径
    private func documentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // 获取 plist 数据文件的路径
    private func dataFilePath() -> URL {
        documentsDirectory().appendingPathComponent("Linkworld.plist")
    }
    
    // 写入本地数据
    private func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(models)
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            print("写入数据时出错: \(error.localizedDescription)")
        }
    }
    
    // 加载本地数据
    private func loadItems() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                models = try decoder.decode([Model].self, from: data)
            } catch {
                print("加载数据时出错: \(error.localizedDescription)")
            }
        }
    }
}
