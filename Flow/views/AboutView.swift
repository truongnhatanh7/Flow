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

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Flow, created by Anh Truong")
                .font(.title)
            Text("Our office")
                .font(.title)
                .padding(.top, 8)
            Spacer()
            MapView(coordinate: IdentifiablePlace(lat: 10.729693487476302, long: 106.69306486904455))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
        .navigationBarTitle("About")

    }
       
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
