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
                    DetailView(person: person)
                } label: {
                    HStack {
                        Image(uiImage: UIImage(data: person.photo) ?? UIImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
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
                loadImage()
            }
            .alert("Add Name", isPresented: $showingNamePrompt) {
                TextField("Name", text: $name)
                Button("Save", action: savePerson)
                Button("Cancel", role: .cancel){ }
            }
        }
    }
    
    func loadImage() {
            Task {
                guard let data = try? await selectedItem?.loadTransferable(type: Data.self) else {
                    return
                }

                selectedImageData = data
                name = ""
                showingNamePrompt = true
            }
        }
    
    func savePerson() {
            guard let imageData = selectedImageData else { return }

            let person = Person(name: name, photo: imageData)
            modelContext.insert(person)

            selectedItem = nil
            selectedImageData = nil
        }

//    func insertTestPerson {
//        guard people.isEmpty else { return }
//
//        let test = Person(
//            name: "Test Person",
//            photo: Data() // empty image for now
//        )
//        modelContext.insert(test)
//    }
}

#Preview {
    ContentView()
}

