//
//  MusicPlayerView.swift
//  Music
//
//  Created by Shotaro Hirano on 2021/08/29.
//

import SwiftUI

struct MusicPlayerView: View {
    @EnvironmentObject var playerManager: MusicPlayerManager
    let audioTracks: [AudioTrackModel]
    init(audioTracks: [AudioTrackModel]) {
        self.audioTracks = audioTracks.filter{ $0.previewURL != nil }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            MusicPlayerImageView(playerManager: _playerManager)
            Text(playerManager.currentTrack?.name ?? "")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding([.leading, .bottom, .trailing])
            Text(playerManager.currentTrack?.artist.name ?? "")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding([.leading, .bottom, .trailing])
            HStack(alignment: .center, spacing: 50) {
                Button(action: {
                    playerManager.backButtonSelected()
                }, label: {
                    Image(systemName: "backward.fill")
                })
                .frame(width: 50, height: 50)
                Button(action: {
                    playerManager.playButtonSelected()
                }, label: {
                    Image(systemName: playerManager.onPlaying ? "pause" : "play.fill")
                })
                .frame(width: 50, height: 50)
                Button(action: {
                    playerManager.nextButtonSelected()
                }, label: {
                    Image(systemName: "forward.fill")
                })
                .frame(width: 50, height: 50)
            }
        }.onAppear {
            if !playerManager.audioTracks.isSameOf(audioTracks) {
                playerManager.audioTracks = audioTracks
            }
        }
        .environmentObject(MusicPlayerManager.shared)
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicPlayerView(audioTracks: [AudioTrackModel.mock(1), AudioTrackModel.mock(2), AudioTrackModel.mock(3)])
            .environment(\.colorScheme, .light)
            .previewDisplayName("light")
            
            MusicPlayerView(audioTracks: [AudioTrackModel.mock(1), AudioTrackModel.mock(2), AudioTrackModel.mock(3)])
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
            MusicPlayerView(audioTracks: [AudioTrackModel.mock(1), AudioTrackModel.mock(2), AudioTrackModel.mock(3)])
                .environment(\.colorScheme, .dark)
                .environment(\.locale, Locale(identifier: "en"))
                .previewDisplayName("English")
        }
    }
}
