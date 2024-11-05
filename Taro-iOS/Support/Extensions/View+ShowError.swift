//
//  View+ShowError.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 05.11.24.
//

import SwiftUI

protocol Errorable: View {}

extension View where Self: Errorable {
    func showError(if errorText: String?) -> some View {
        self
            .environment(\.errorText, errorText)
    }
}

extension EnvironmentValues {
    @Entry var errorText: String? = nil
}
