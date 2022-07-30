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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
