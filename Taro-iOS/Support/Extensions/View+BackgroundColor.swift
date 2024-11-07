//
//  View+BackgroundColor.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 04.11.24.
//

import SwiftUI

extension View {
    func backgroundColor(_ color: Color, dismissKeyboardOnTap: Bool = false) -> some View {
        ZStack {
            if dismissKeyboardOnTap {
                color
                    .edgesIgnoringSafeArea(.all)
                    .dismissKeyboardOnTap()
            } else {
                color
                    .edgesIgnoringSafeArea(.all)
            }
            self
        }
    }
}
