//
//  Person.swift
//  PhotoApp
//
//  Created by Ihor Sukhachov on 06.01.2026.
//

import SwiftData
import Foundation

@Model
class Person: Identifiable {
    var name: String
    
    @Attribute(.externalStorage)
    var photo: Data

    init(name: String, photo: Data) {
        self.name = name
        self.photo = photo
    }
}
