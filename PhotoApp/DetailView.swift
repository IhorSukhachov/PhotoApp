//
//  DetailView.swift
//  PhotoApp
//
//  Created by Ihor Sukhachov on 06.01.2026.
//

import SwiftUI
import MapKit


struct DetailView: View {
    let person: Person
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: person.photo) ?? UIImage())
                .resizable()
                .scaledToFit()
                .padding()
            
            if let lat = person.latitude, let lon = person.longitude {
                // show map here
            } else {
                Text("Location unavailable")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let person = Person(name: "Test", photo: Data(), latitude: nil, longitude: nil)
       NavigationStack {
           DetailView(person: person)
       }
}
