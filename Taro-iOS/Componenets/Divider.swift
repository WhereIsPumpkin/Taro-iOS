//
//  Divider.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 07.11.24.
//

import SwiftUI

struct Divider: View {
    
    var placeholder: LocalizedStringKey
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.colorHex6C6A60)
            
            Text(placeholder)
                .foregroundColor(.white)
                .font(.roboto(size: 12, .medium))
                .padding(.horizontal, 4)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.colorHex6C6A60)
        }
    }
}
