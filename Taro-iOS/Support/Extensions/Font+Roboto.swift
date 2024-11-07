//
//  Font+Roboto.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 04.11.24.
//

import SwiftUI

extension Font {
    static func roboto(size: CGFloat, _ weight: RobotoWeight) -> Font {
        switch weight {
        case .light:
            return Font.custom("Roboto-Light", size: size)
        case .regular:
            return Font.custom("Roboto-Regular", size: size)
        case .medium:
            return Font.custom("Roboto-Medium", size: size)
        case .bold:
            return Font.custom("Roboto-Bold", size: size)
        }
    }
}

enum RobotoWeight {
    case light
    case regular
    case medium
    case bold
}
