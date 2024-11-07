//
//  WelcomeView.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 07.11.24.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var path: [Destinations]
    
    var body: some View {
        VStack(spacing: 12) {
            
            Image(.logoIcon).padding(.bottom, 20)
            
            title
            
            description.padding(.bottom, 28)
            
            heroImage.padding(.bottom, 12)
            
            createAccountButton.padding(.bottom, 8)
            
            signInTextButton.padding(.bottom, 12)
            
            googleIcon
            
        }
        .padding(.horizontal, 40)
        .padding(.top, 16)
        .backgroundColor(.background)
       

    }
    
    private var title: some View {
        Group {
            Text("Create an account to unlock")
                .font(.roboto(size: 32, .bold))
                .foregroundColor(.white)
            
            +
            
            Text(" all features")
                .font(.roboto(size: 32, .bold))
                .foregroundColor(.accent)
        }
        .multilineTextAlignment(.center)
    }
    
    private var description: some View {
        Text("Buy, sell and discover books")
            .foregroundStyle(.secondaryText)
            .font(.roboto(size: 16, .medium))
    }
    
    private var heroImage: some View {
        Image(.welcome)
            .resizable()
            .scaledToFit()
            .frame(height: 277)
    }
    
    private var createAccountButton: some View {
        Button {
            path.append(.login)
        } label: {
            Label("Create Account", systemImage: "arrow.forward")
                .padding(.horizontal, 48)
                .padding(.vertical, 16)
                .frame(height: 52)
                .background(.accent)
                .foregroundStyle(.white)
                .font(.roboto(size: 16, .bold))
                .clipShape(.capsule)
                .labelStyle(.textFirst)
        }
    }
    
    private var signInTextButton: some View {
        Button {
            print("!23")
        } label: {
            Group {
                Text("Already have an account? ")
                    .foregroundColor(.secondaryText)
                    .font(.roboto(size: 14, .regular))
                
                +
                
                Text("Sign In")
                    .foregroundColor(.accent)
                    .font(.roboto(size: 14, .bold))
            }
        }

    }
    
    private var googleIcon: some View {
        Button {
            print("Google")
        } label: {
            Image(.googleIcon)
        }

    }
}

@available(iOS 17, *)
#Preview {
    
    @Previewable @State var path = [Destinations]()
    
    NavigationStack(path: $path) {
        WelcomeView(path: $path)
    }
}
