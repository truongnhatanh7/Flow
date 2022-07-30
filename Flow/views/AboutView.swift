//
//  AboutView.swift
//  Flow
//
//  Created by Truong Nhat Anh on 29/07/2022.
//

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
