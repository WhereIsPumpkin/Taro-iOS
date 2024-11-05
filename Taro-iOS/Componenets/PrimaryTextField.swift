//
//  PrimaryTextField.swift
//  Taro-iOS
//
//  Created by sgogrichiani on 05.11.24.
//

import SwiftUI

struct PrimaryTextField: View {
    
    // MARK: - Properties
    let placeholder: String
    @Binding var text: String
    @FocusState private var isFocused: Bool
    @Environment(\.errorText) private var errorText: String?
    
    // MARK: - Initialization
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField(.empty, text: $text, prompt: placeholderText)
                .padding(16)
                .background(.colorHex393937)
                .clipShape(.rect(cornerRadius: 16))
                .overlay { stroke }
                .foregroundStyle(.white)
                .font(.roboto(size: 16, .medium))
                .focused($isFocused)
            
            if let error = errorText {
                showErrorText(error)
            } else {
                reserveSpace
            }
        }
    }

    // MARK: - UI Elements
    private var placeholderText: Text {
        Text(placeholder)
            .font(.roboto(size: 16, .medium))
            .foregroundColor(.secondaryText)
    }

    private var stroke: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(strokeColor, lineWidth: strokeWidth)
    }

    private var strokeColor: some ShapeStyle {
        if errorText != nil {
            return .red
        } else {
            return isFocused ? .accent : .colorHex6C6A60.opacity(0.5)
        }
    }

    private var strokeWidth: CGFloat {
        isFocused || errorText != nil ? 2 : 1
    }
    
    private func showErrorText(_ error: String) -> some View {
        Text(error)
            .foregroundColor(.colorHexFF2C2C)
            .font(.roboto(size: 12, .medium))
            .padding(.leading, 4)
    }
    
    private var reserveSpace: some View {
        Text(.empty)
            .font(.roboto(size: 12, .medium))
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var text = ""
    
    PrimaryTextField("Email", text: $text)
        .padding()
        .showError(if: "Email Is Not Valid")
}
