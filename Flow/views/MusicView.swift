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

struct MusicView: View {
    @State var music: Music
    @EnvironmentObject var data: DataHandler

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
            if music != data.selectedMusic{
                let sound = Bundle.main.path(forResource: "\(music.fileName)", ofType: "mp3")
                data.audioPlayer =  try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                data.audioPlayer?.play();
            }

        }
        .navigationBarTitle("Listen")
    }

        
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(music: DataHandler().musics[0])
    }
}
