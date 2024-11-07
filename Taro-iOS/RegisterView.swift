//
//  RegisterView.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 05.11.24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @FocusState var isUsernameFocused: Bool
    @FocusState var isEmailFocused: Bool
    @FocusState var isPasswordFocused: Bool

    var body: some View {
        VStack(spacing: 12) {
            PrimaryTextField("Username", text: $username)
                .focused($isUsernameFocused)

            PrimaryTextField("Email", text: $email)
                .focused($isEmailFocused)

            PrimaryTextField("Password", text: $password)
                .focused($isPasswordFocused)
        }
    }
}

#Preview {
    RegisterView()
}
