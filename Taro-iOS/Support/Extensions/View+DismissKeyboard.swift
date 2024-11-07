//
//  View+DismissKeyboard.swift
//  Taro-iOS
//
//  Created by sgogrichiani on 06.11.24.
//

import SwiftUI

// MARK: - View Modifiers for Keyboard Dismissal
struct DismissKeyboardOnScrollModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollDismissesKeyboard(.immediately)
    }
}

struct DismissKeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

// MARK: - View Extension to Apply Modifiers
extension View {
    
    /// Applies the modifier to dismiss the keyboard when scrolling, if supported.
    func dismissKeyboardOnScroll() -> some View {
        modifier(DismissKeyboardOnScrollModifier())
    }

    /// Applies the modifier to manually dismiss the keyboard when tapping on the view.
    func dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardModifier())
    }
}
