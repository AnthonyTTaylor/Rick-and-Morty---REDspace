//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import Foundation

// MARK: - CharacterModel

struct Results: Codable {
    let info: Info
    let results: [CharacterModel]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: JSONNull?
}

// MARK: - Result
struct CharacterModel: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}



