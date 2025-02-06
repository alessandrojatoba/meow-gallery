//
//  Breed.swift
//  Meow Gallery
//
//  Created by Alessandro Jatoba on 06/02/25.
//

import Foundation

struct Breed: Codable {
    struct Weight: Codable {
        let imperial: String
        let metric: String
    }

    let id: String
    let name: String
    let weight: Weight
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament: String
    let origin: String
    let countryCodes: String
    let countryCode: String
    let description: String
    let lifeSpan: String
    let indoor: Int
    let lap: Int?
    let adaptability: Int
    let affectionLevel: Int
    let childFriendly: Int
    let catFriendly: Int?
    let dogFriendly: Int
    let energyLevel: Int
    let grooming: Int
    let healthIssues: Int
    let intelligence: Int
    let sheddingLevel: Int
    let socialNeeds: Int
    let strangerFriendly: Int
    let vocalisation: Int
    let bidability: Int?
    let experimental: Int
    let hairless: Int
    let natural: Int
    let rare: Int
    let rex: Int
    let suppressedTail: Int
    let shortLegs: Int
    let wikipediaURL: String?
    let hypoallergenic: Int
    let referenceImageID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, weight, temperament, origin, description, indoor, lap, adaptability, affectionLevel = "affection_level",
             childFriendly = "child_friendly", catFriendly = "cat_friendly", dogFriendly = "dog_friendly",
             energyLevel = "energy_level", grooming, healthIssues = "health_issues", intelligence,
             sheddingLevel = "shedding_level", socialNeeds = "social_needs", strangerFriendly = "stranger_friendly",
             vocalisation, bidability, experimental, hairless, natural, rare, rex, suppressedTail = "suppressed_tail",
             shortLegs = "short_legs", wikipediaURL = "wikipedia_url", hypoallergenic, referenceImageID = "reference_image_id",
             cfaURL = "cfa_url", vetstreetURL = "vetstreet_url", vcahospitalsURL = "vcahospitals_url",
             countryCodes = "country_codes", countryCode = "country_code", lifeSpan = "life_span"
    }
}
