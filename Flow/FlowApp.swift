//
//  FlowApp.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import SwiftUI

@main
struct FlowApp: App {
    @StateObject private var data = DataHandler()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}
