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

struct ContentView: View {
    @EnvironmentObject var data: DataHandler

    var body: some View {

            TabView {
                NavigationView {
                    PlayView()
                }
                        .tabItem {
                            Image(systemName: "play")
                            Text("Play")
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
