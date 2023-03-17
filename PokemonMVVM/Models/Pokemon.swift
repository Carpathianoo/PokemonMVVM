//
//  Pokemon.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 15/03/23.
//

import Foundation

struct Pokemon: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [BaseData]
    
}

// MARK: - Result
struct BaseData: Codable {
    let name: String
    let url: String
}
