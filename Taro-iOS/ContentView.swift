//
//  ContentView.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 04.11.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isRegisterSelected = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
            VStack {
                header
                
                Spacer(minLength: 36)
                
                authenticationSection
            }
            .padding(.top, 104)
            .backgroundColor(.background)
            .animation(.default, value: isRegisterSelected)
    }
    
    private var header: some View {
        VStack(spacing: 24) {
            Image(.logoIcon)
            titleSection
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            titleText
            descriptionText
        }
    }
    
    private var titleText: some View {
        Text("Welcome Back")
            .font(.roboto(size: 32, .medium))
            .foregroundStyle(.white)
    }
    
    private var descriptionText: some View {
        Text("Buy, sell, and get alerts for your favorite books — simple and seamless.")
            .font(.roboto(size: 12, .regular))
            .foregroundStyle(.secondaryText)
            .padding(.horizontal, 80)
            .multilineTextAlignment(.center)
    }
    
    private var authenticationSection: some View {
        VStack(spacing: 36) {
            authenticationTypeSegment
         
            if !isRegisterSelected {
                VStack(spacing: 24) {
                    
                    PrimaryTextField(text: $email, placeholder: "Email")
                    
                    PrimaryTextField(text: $password, placeholder: "Password")
                }
            } else {
                VStack(spacing: 24) {
                    
                    PrimaryTextField(text: $email, placeholder: "Email")
                    
                    PrimaryTextField(text: $email, placeholder: "Username")
                    
                    PrimaryTextField(text: $password, placeholder: "Password")
                }
            }
            
            Spacer()
        }
        .padding(24)
        .background(.colorHex272623)
        .clipShape(.rect(cornerRadii: .init(topLeading: 20, topTrailing: 20)))
        .overlay(stroke)
        .ignoresSafeArea()
    }
    
    private var stroke: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(.colorHex6C6A60.opacity(0.25), lineWidth: 1)
    }
    
    private var authenticationTypeSegment: some View {
        SegmentControl(isComponentTapped: $isRegisterSelected)
    }
    
    private var selectedComponenet: some View {
        VStack {
            Text("Login")
                .foregroundStyle(.white)
                .font(.roboto(size: 16, .medium))
        }
        .frame(maxHeight: .infinity)
        .frame(width: (UIScreen.main.bounds.width - 48) / 2)
        .background(.accent)
        .clipShape(.capsule)
    }
}

#Preview {
    ContentView()
}
