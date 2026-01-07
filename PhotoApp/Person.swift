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

    var latitude: Double?
    var longitude: Double?
    
    init(name: String, photo: Data, latitude: Double?, longitude: Double?) {
        self.name = name
        self.photo = photo
        self.latitude = latitude
        self.longitude = longitude
    }
}
