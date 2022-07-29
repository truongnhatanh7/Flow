//
//  Player.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI
import AVKit

struct Player: View {
    @EnvironmentObject var data: DataHandler
    @State var music: Music?
    @State private var musicValue = 0.0;
    @State private var duration = 0.0
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        VStack {
            if music != nil {
                Slider(value: $musicValue, in: 0...duration) { editing in
                        if !editing {
                            data.audioPlayer.currentTime = musicValue
                        }
                    
                }
                .accentColor(.white)
            }


            HStack {
                data.selectedMusic?.image
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    data.selectedMusic == nil ?
                    Text("No playing")
                        .font(.title)
                        .foregroundColor(.white) : (
                            Text("\(data.selectedMusic!.title)")
                        .font(.title)
                        .foregroundColor(.white)
                    )
                }.padding(.leading, 2)
                Spacer()
                Button {
                    data.audioPlayer?.play()
                } label: {
                    Image(systemName: "play.fill")
                
                }
                .padding()
                .background(.gray)
                .foregroundColor(.white)
                .clipShape(Circle())
                
                
                Button {
                    data.audioPlayer?.pause()
                } label: {
                    Image(systemName: "pause.fill")
                }
                .padding()
                .background(.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(.leading, 4)
            }
        }
        .padding()
        .background(Color("MyDark"))
        .onReceive(timer) { _ in
            guard let player = data.audioPlayer else { return }
            musicValue = player.currentTime
            duration = player.duration
        }

    }

        
}

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player(music: DataHandler().musics[0])
    }
}
