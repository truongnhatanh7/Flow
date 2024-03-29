/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Truong Nhat Anh
 ID: s3878231
 Created  date: 30/07/2022
 Last modified: 31/07/2022
 Acknowledgement: Apple SwiftUI Documentation, RMIT Lecture slides, StackOverflow
 */

import SwiftUI
import AVKit

struct Player: View {
    @EnvironmentObject var data: DataHandler
    @State var music: Music?
    @State private var musicValue = 0.0;
    @State private var duration = 0.0
    @State private var sliderIsEditing = false
    @State var parent = "PlayView"
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        VStack {
            // Slider section
            if music != nil && data.audioPlayer != nil {
                VStack {
                    Slider(value: $musicValue, in: 0...duration) { editing in
                        sliderIsEditing = editing
                        if !editing {
                            data.audioPlayer?.currentTime = musicValue
                        }
                        
                    }
                    .accentColor(.gray)
                    // Time indicator section
                    HStack {
                        Text(DateComponentsFormatter.positional.string(from: data.audioPlayer?.currentTime ?? 0.0) ?? "0:00")
                        Spacer()
                        Text(DateComponentsFormatter.positional.string(from: data.audioPlayer?.duration ?? 0.0) ?? "0:00")
                    }
                }
            }
            
            
            HStack {
                // Image section
                if data.selectedMusic != nil {
                    NavigationLink(destination: MusicView(music: data.selectedMusic!)){
                        data.selectedMusic?.image
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .disabled(parent == "MusicView" ? true : false)
                }
                
                VStack(alignment: .leading) {
                    data.selectedMusic == nil ?
                    Text("No playing")
                        .font(.title) : (
                            Text("\(data.selectedMusic!.title)")
                                .font(.title)
                            
                        )
                }.padding(.leading, 2)
                Spacer()
                
                // Control buttons
                //Play button
                Button {
                    data.audioPlayer?.play()
                } label: {
                    Image(systemName: "play.fill")
                    
                }
                .padding()
                .background(.gray)
                .foregroundColor(.white)
                .clipShape(Circle())
                // Pause button
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
        .onReceive(timer) { _ in
            // Prevent glitchy slider + update time
            guard let player = data.audioPlayer, !sliderIsEditing else { return }
            musicValue = player.currentTime
            duration = player.duration
        }
        .onAppear {
            // Set time indicator
            if data.audioPlayer != nil {
                musicValue = data.audioPlayer?.currentTime ?? 0.0;
                duration = data.audioPlayer?.duration ?? 0.0;
            }
        }
        
    }
    
    
}

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player(music: DataHandler().musics[0])
    }
}
