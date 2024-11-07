//
//  ContentView.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 04.11.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLeftSegmentSelected = true
    @FocusState var isEmailFocused: Bool
    @FocusState var isUsernameFocused: Bool
    
    var body: some View {
        VStack {
            
            if isEmailFocused || isUsernameFocused {
                EmptyView()
            } else {
                header
                Spacer(minLength: 36)
            }
            
            authenticationSection
        }
        .padding(.top, isEmailFocused || isUsernameFocused ? 16 : 104)
        .backgroundColor(.background, dismissKeyboardOnTap: true)
        .animation(.default, value: isLeftSegmentSelected)
        .animation(.easeInOut(duration: 0.1), value: isEmailFocused)
        .animation(.easeInOut(duration: 0.1), value: isUsernameFocused)
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
            
            if isLeftSegmentSelected {
                LoginView(isEmailFocused: _isEmailFocused)
            } else {
                RegisterView(isUsernameFocused: _isUsernameFocused)
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
        SegmentedControl(isLeftSegmentSelected: $isLeftSegmentSelected,
                         leftSegmentTitle: "Login",
                         rightSegmentTitle: "Register")
    }
}

#Preview {
    ContentView()
}
