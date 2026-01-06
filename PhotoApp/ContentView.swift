//
//  ContentView.swift
//  PhotoApp
//
//  Created by Ihor Sukhachov on 06.01.2026.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Person.name) private var people: [Person]
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var showingNamePrompt: Bool = false
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            List(people) {person in
                NavigationLink {
            //        DetailView(person: person)
                } label: {
                    HStack {
                        Image(uiImage: UIImage(data: person.photo) ?? UIImage())
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(.capsule)
                        Text(person.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Image(systemName: "plus")
                }
            }
            .onChange(of: selectedItem) {
          //      loadImage()
            }
            .alert("Add Name", isPresented: $showingNamePrompt) {
                TextField("Name", text: $name)
                Button("Save", action: savePerson)
                Button("Cancel", role: .cancel){ }
            }
        }
    }
}

#Preview {
    ContentView()
}

