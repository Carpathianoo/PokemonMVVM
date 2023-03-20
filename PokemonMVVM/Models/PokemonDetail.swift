//
//  PokemonDetail.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 16/03/23.
//

import Foundation

struct PokemonDetail: Codable {

    let id: Int
    let name: String
    let moves: [Move]
    let sprites: Sprite
    let stats: [Stats]

}

struct Move: Codable {
    let move: MoveModel
}

struct MoveModel: Codable {
    let name: String

}

struct Sprite: Codable {
    let other: HomeSprite

}

struct HomeSprite: Codable {
    let home: SpritesUrl
    
}

struct SpritesUrl: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

}

struct Stats: Codable {
    let baseStat: Int
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
    }
}


