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


struct SearchView: View {
    @State private var searchText = ""
    @EnvironmentObject var data: DataHandler
    
    var body: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.self) { music in
                    NavigationLink {
                        MusicView(music: music)
                    } label: {
                        MusicRow(music: music);
                    }
                    .onDisappear {
                        data.selectedMusic = music
                    }
                }
                .listRowSeparator(.hidden)
            }
            .searchable(text: $searchText)
        
            
            Spacer()
            Player(parent: "SearchView")
        }
        .navigationBarTitle("Search")

       
    }
    
    var searchResults: [Music] {
        if searchText.isEmpty {
            return data.musics;
        } else {
            return data.musics.filter { music in
                return music.title.contains(searchText)
            }
        }
    }
    
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
