//
//  ContentView.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 04.11.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLeftSegmentSelected = true
    
    var body: some View {
            VStack {
                
                header
                
                Spacer(minLength: 36)
                
                authenticationSection
            }
            .padding(.top, 104)
            .backgroundColor(.background)
            .animation(.default, value: isLeftSegmentSelected)
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
        ScrollView {
            VStack(spacing: 36) {
                
                authenticationTypeSegment
             
                if isLeftSegmentSelected {
                    LoginView()
                } else {
                    RegisterView()
                }
                
                Spacer()
            }
           
        }
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
