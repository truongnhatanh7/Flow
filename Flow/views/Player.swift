//
//  Player.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI
import AVKit

struct Player: View {
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        HStack {
            Image("logic_keanu_reeves")
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            Button {
                self.audioPlayer.play()
            } label: {
                Image(systemName: "play.fill")
            }
            
            
            Button {
                self.audioPlayer.pause()
            } label: {
                Image(systemName: "pause.fill")
            }


            
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "logic_keanu_reeves", ofType: "mp3")
            self.audioPlayer =  try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        .padding()
    }

        
}

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player()
    }
}
