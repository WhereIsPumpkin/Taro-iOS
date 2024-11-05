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
    
    var body: some View {
        VStack(spacing: 12) {
            
            PrimaryTextField("Username", text: $username)
            
            PrimaryTextField("Email", text: $email)
            
            PrimaryTextField("Password", text: $password)
        }
    }
}

#Preview {
    RegisterView()
}
