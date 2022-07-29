//
//  Music.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

import Foundation
import SwiftUI

struct Music: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var fileName: String
    var artist: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
    
}

