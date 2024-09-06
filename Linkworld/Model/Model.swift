//
//  Model.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/4.
//

import Foundation
import SwiftUI

struct Model: Identifiable, Codable, Equatable {
    var id = UUID()
    var platformIcon: String
    var title: String
    var platformName: String
    var indexURL: String
}


enum CodingKeys: String, CodingKey {
    case platformIcon, title, platformName, indexURL
}


