//
//  MusicApp.swift
//  Music
//
//  Created by 平野翔太郎 on 2021/08/01.
//

import SwiftUI
import Combine

@main
struct MusicApp: App {
    init() {
        if #available(iOS 16.0, *) {
            
        } else {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.backgroundColor = Color.primaryUIColor
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().tintColor = UIColor.white
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
