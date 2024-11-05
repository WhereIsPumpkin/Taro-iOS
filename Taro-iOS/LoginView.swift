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
    
    var body: some View {
        VStack(spacing: 12) {
            
            PrimaryTextField("Email", text: $email)
                .keyboardType(.numberPad)
            
            PrimaryTextField("Password", text: $password)
        }
    }
    
}
