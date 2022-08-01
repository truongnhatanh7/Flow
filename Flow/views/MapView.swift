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
import MapKit

struct MapView: View {
    var coordinate: IdentifiablePlace
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [coordinate]) { coor in
            MapMarker(coordinate: coordinate.location, tint: Color.red)
        }
        .onAppear {
            setRegion(coordinate.location)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: IdentifiablePlace(id: UUID(), lat: 100, long: 100))
    }
}
