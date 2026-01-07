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
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                let startPosition = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )
                )
                Map(initialPosition: startPosition) {
                    Annotation("\(person.name)", coordinate: coordinate) {
                        Image(systemName: "star.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.red)
                            .background(.white)
                            .clipShape(Circle())
                    }
                }
                .frame(height: 300)
                .padding()
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
