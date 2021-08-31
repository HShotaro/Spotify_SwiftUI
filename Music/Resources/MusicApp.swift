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
        
    }
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var playerManager: MusicPlayerManager
    
    private var cancelables = Set<AnyCancellable>()
    var body: some Scene {
        WindowGroup {
            ContentView(authManager: _authManager, playerManager: _playerManager)
                .environmentObject(AuthManager.shared)
                .environmentObject(MusicPlayerManager.shared)
        }
    }
}
