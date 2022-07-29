//
//  ContentView.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data: DataHandler
    var body: some View {
//        NavigationView {
//            TabView {
//                SearchView()
//                    .tabItem {
//                        Image(systemName: "magnifyingglass")
//                        Text("Search")
//                    }
//                MusicView(music: data.musics[0])
//                    .tabItem {
//                        Image(systemName: "music.note")
//                        Text("Now")
//                    }
//                AboutView()
//                    .tabItem {
//                        Image(systemName: "face.smilling")
//                        Text("About")
//                    }
//            }
//        }
//        .environmentObject(DataHandler())
        NavigationView {
            SearchView()
        }
        .environmentObject(data)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
