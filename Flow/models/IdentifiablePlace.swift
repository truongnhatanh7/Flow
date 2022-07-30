/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Truong Nhat Anh
  ID: s3878231
  Created  date: 15/7/2022
  Last modified: 17/7/2022
  Acknowledgement: www.hackingwithswift.com, COSC2659 Lecture slides, Stackoverflow
*/

import Foundation
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
    init(id: UUID = UUID(), location: CLLocationCoordinate2D) {
        self.id = id
        self.location = location
    }
    
}
