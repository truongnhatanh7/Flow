//
//  MusicRow.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI

struct MusicRow: View {
    var music: Music
    var body: some View {
        HStack {
            music.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("\(music.title)")
                    .font(.title)
                Text("\(music.artist)")
                    .font(.subheadline)
            }
            .padding(.leading, 8)
        }
        .padding()
    }
}

struct MusicRow_Previews: PreviewProvider {
    static var previews: some View {
        MusicRow(music: DataHandler().musics[0])
            .environmentObject(DataHandler())
    }
}
