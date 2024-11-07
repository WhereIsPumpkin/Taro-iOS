//
//  Taro_iOSApp.swift
//  Taro-iOS
//
//  Created by Saba Gogrichiani on 04.11.24.
//

import SwiftUI

@main
struct Taro_iOSApp: App {
    
    @State var path: [Destinations] = []

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                WelcomeView(path: $path)
                    .navigationDestination(for: Destinations.self) { route in
                        switch route {
                        case .login:
                            ContentView(path: $path)
                        case .signup:
                            RegisterView()
                        }
                    }
            }
            
        }
    }
}

enum Destinations: Hashable {
    case login
    case signup
}
