//
//  SearchView.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @EnvironmentObject var data: DataHandler
    var body: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.self) { music in
                    NavigationLink {
                        MusicView()
                    } label: {
                        MusicRow(music: music);
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText)
            Spacer()
            Player()
        }


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