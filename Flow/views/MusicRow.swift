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
