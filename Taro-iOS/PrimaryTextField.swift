//
//  PrimaryTextField.swift
//  Taro-iOS
//
//  Created by sgogrichiani on 05.11.24.
//

import SwiftUI

struct PrimaryTextField: View {
    @Binding var text: String
    let placeholder: String
    @FocusState private var isFocused: Bool

    var body: some View {
        TextField(.empty, text: $text, prompt: placeholderText)
            .padding(16)
            .background(.colorHex393937)
            .clipShape(.rect(cornerRadius: 16))
            .overlay { stroke }
            .foregroundStyle(.white)
            .font(.roboto(size: 16, .medium))
            .focused($isFocused)
    }

    private var placeholderText: Text {
        Text(placeholder)
            .font(.roboto(size: 16, .medium))
            .foregroundColor(.secondaryText)
    }

    private var stroke: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(isFocused ? Color.accent : Color.colorHex6C6A60.opacity(0.5), lineWidth: isFocused ? 2 : 1)
    }
}

#Preview {
    PrimaryTextField(text: .constant(.empty), placeholder: "Email")
        .padding()
}
