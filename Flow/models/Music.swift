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

