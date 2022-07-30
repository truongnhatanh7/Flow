//
//  MusicView.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI
import AVKit

struct MusicView: View {
    @State var music: Music
    @EnvironmentObject var data: DataHandler
    @State private var isRotated = true
    @State private var rotation = 0.0

    var body: some View {
        VStack {
            music.image
                .resizable()
                .frame(width: 360, height: 360)
                .padding()

            Text("\(music.title)")
                .font(.title)
                .padding(.top, 32)
            Text("\(music.artist)")
                .font(.subheadline)
            Spacer()
            Player(music: music, parent: "MusicView")
                
        }
        .onAppear {
//            data.selectedMusic = music;
            if music != data.selectedMusic{
                let sound = Bundle.main.path(forResource: "\(music.fileName)", ofType: "mp3")
                data.audioPlayer =  try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                data.audioPlayer.play();
            }

        }
        .navigationTitle("Listen")
    }

        
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(music: DataHandler().musics[0])
    }
}
