//
//  View+BackgroundColor.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 04.11.24.
//

import SwiftUI

extension View {
    func backgroundColor(_ color: Color) -> some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            self
        }
    }
}
