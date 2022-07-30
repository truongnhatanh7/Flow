//
//  DataHandler.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import Foundation
import Combine
import AVKit

final class DataHandler: ObservableObject {
    @Published var musics: [Music] = load("data.json")
    @Published var audioPlayer: AVAudioPlayer?
    @Published var selectedMusic: Music?
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Cannot find file")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Failed")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
