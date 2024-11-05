//
//  SegmentedControl.swift
//  Taro-iOS
//
//  Created by sgogrichiani on 05.11.24.
//

import SwiftUI

struct SegmentedControl: View {
    
    @Binding var isLeftSegmentSelected: Bool
    let leftSegmentTitle: String
    let rightSegmentTitle: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.accent
                    .clipShape(Capsule())
                    .frame(width: (geometry.size.width - 8) / 2)
                    .frame(maxWidth: .infinity,
                           alignment: isLeftSegmentSelected ? .leading : .trailing)
                    .animation(.snappy, value: isLeftSegmentSelected)
                    .padding(4)
            }
            .background(.colorHex393937)
            .frame(height: 56)
            .clipShape(Capsule())
            .overlay(alignment: .leading) { leftSegment(geometry) }
            .overlay(alignment: .trailing) { rightSegment(geometry) }
        }
        .frame(height: 56)
    }
    
    private func leftSegment(_ geometry: GeometryProxy) -> some View {
        HStack {
            Text(leftSegmentTitle)
                .frame(width: (geometry.size.width - 8) / 2)
                .foregroundColor(isLeftSegmentSelected ? .white : .secondaryText)
                .font(.roboto(size: 16,isLeftSegmentSelected ? .bold : .regular))
        }
        .padding(4)
        .contentShape(Rectangle())
        .onTapGesture {
            isLeftSegmentSelected = true
        }
    }
    
    private func rightSegment(_ geometry: GeometryProxy) -> some View {
        HStack {
            Text(rightSegmentTitle)
                .frame(width: (geometry.size.width - 8) / 2)
                .foregroundColor(isLeftSegmentSelected ? .secondaryText : .white)
                .font(.roboto(size: 16, isLeftSegmentSelected ? .regular : .bold))
        }
        .padding(4)
        .contentShape(Rectangle())
        .onTapGesture {
            isLeftSegmentSelected = false
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var isLeftSegmentSelected = true
    
    SegmentedControl(
        isLeftSegmentSelected: $isLeftSegmentSelected,
        leftSegmentTitle: "Option 1",
        rightSegmentTitle: "Option 2"
    )
}
