//
//  Cat.swift
//  Meow Gallery
//
//  Created by Alessandro Jatoba on 06/02/25.
//

import Foundation

struct Cat: Identifiable, Codable {
    let id: String
    let url: String
    let breeds: [Breed]?
}
