//
//  DetailView.swift
//  PhotoApp
//
//  Created by Ihor Sukhachov on 06.01.2026.
//

import SwiftUI


struct DetailView: View {
    let person: Person
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: person.photo) ?? UIImage())
                .resizable()
                .scaledToFit()
                .padding()
        }
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let person = Person(name: "Test", photo: Data())
       NavigationStack {
           DetailView(person: person)
       }
}
