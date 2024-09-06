//
//  TitleInputView.swift
//  Linkworld
//
//  Created by kaikai on 2024/9/5.
//

import SwiftUI

struct TitleInputView: View {
    
    @Binding var title: String
    
    var body: some View {
        TextField("请输入头衔", text: $title)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .disableAutocorrection(true)
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
    }
}


#Preview {
    TitleInputView(title: .constant(""))
}
