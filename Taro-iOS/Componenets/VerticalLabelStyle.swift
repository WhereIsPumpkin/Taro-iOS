//
//  VerticalLabelStyle.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 07.11.24.
//

import SwiftUI

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 8) {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == VerticalLabelStyle {

    /// A label style that displays text before icon
    ///
    @MainActor @preconcurrency static var textFirst: VerticalLabelStyle {
        VerticalLabelStyle()
    }
}
