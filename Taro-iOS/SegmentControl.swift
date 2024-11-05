//
//  SegmentControl.swift
//  Taro-iOS
//
//  Created by sgogrichiani on 05.11.24.
//

import SwiftUI

struct SegmentControl: View {
    
    @Binding var isComponentTapped: Bool
    
    var body: some View {
        Group {
            GeometryReader { geometry in
                ZStack {
                    Color.accent
                        .clipShape(.capsule)
                        .frame(width: ( geometry.size.width - 8 ) / 2)
                        .layoutPriority(1)
                }
                .frame(maxWidth: .infinity, alignment: isComponentTapped ? .trailing : .leading)
                .animation(.snappy, value: isComponentTapped)
                .padding(4)
                .background(.colorHex393937)
                .frame(maxHeight: 56)
                .clipShape(.capsule)
                .overlay(alignment: .leading) {
                    HStack {
                        Text("Login")
                            .frame(width: ( geometry.size.width - 8 ) / 2)
                            .foregroundStyle(isComponentTapped ? .secondaryText : .white)
                            .font(.roboto(size: 16, isComponentTapped ? .regular : .bold))
                    }
                    .padding(4)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isComponentTapped = false
                    }
                }
                .overlay(alignment: .trailing) {
                    HStack {
                        Text("Register")
                            .frame(width: ( geometry.size.width - 8 ) / 2)
                            .foregroundStyle(isComponentTapped ? .white : .secondaryText)
                            .font(.roboto(size: 16, isComponentTapped ? .bold : .regular))
                    }
                    .padding(4)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isComponentTapped = true
                    }
                }
            }
        }
        .frame(maxHeight: 56)
    }
}

#Preview {
    SegmentControl(isComponentTapped: .constant(false))
}
