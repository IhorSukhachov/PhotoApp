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

    }
}

#Preview {
    ContentView()
}

