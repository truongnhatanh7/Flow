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
    
    var body: some View {
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
        .padding()
        .background(Color("MyDark"))

    }

        
}

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player(music: DataHandler().musics[0])
    }
}
