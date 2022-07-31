//
//  ContentView.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @EnvironmentObject var data: DataHandler

    var body: some View {

            TabView {
                NavigationView {
                    SearchView()
                }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .navigationViewStyle(.stack)
                NavigationView {
                    AboutView()
                }
                        .tabItem {
                            Image(systemName: "house")
                            Text("About")
                        }
                        .navigationViewStyle(.stack)

                
            }
            .background(Color("MyDark"))
            .environmentObject(data)
            .onLoad {
                // Set up background audio
                do {
                    let session = AVAudioSession.sharedInstance()
                    try session.setActive(true)
                    try session.setCategory(.playback, mode: .default,  options: .defaultToSpeaker)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
