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
    @State var isLoading = false
    
    var body: some View {
        VStack(spacing: 12) {
            
            PrimaryTextField("Email", text: $email)
                .focused($isEmailFocused)
            
            PrimaryTextField("Password", text: $password)
                .focused($isPasswordFocused)
            
            Button("Continue"){
                print("Hello")
            }
            .buttonStyle(.primary(isLoading: isLoading))
            .padding(.top, 20)
            
            Text("Forgot password?")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.roboto(size: 12, .medium))
                .onTapGesture {
                    isLoading.toggle()
                }
            
            Divider(placeholder: "Or")
                .padding(.top, 12)
            
            Image(.continueWithGoogle)
                .padding(.top, 12)
        }
    }
    
}

#Preview {
    LoginView()
        .backgroundColor(.background)
}

