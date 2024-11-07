//
//  LoginView.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 05.11.24.
//


import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @FocusState var isEmailFocused: Bool
    @FocusState var isPasswordFocused: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            
            PrimaryTextField("Email", text: $email)
                .focused($isEmailFocused)
            
            PrimaryTextField("Password", text: $password)
                .focused($isPasswordFocused)
        }
    }
    
}
