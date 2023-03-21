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
    var moves: [Move]
    let sprites: Sprite
    let stats: [Stats]

}

struct Move: Codable {
    var move: MoveModel
    
}

struct MoveModel: Codable {
    let name: String
    let url: String
    var moveDetail: MoveDetailModel?
}

struct MoveDetailModel: Codable {
    let power: Int?
    let accuracy: Int?
    let pp: Int?
    let effectEntries: [EffectModel]
    
    enum CodingKeys: String, CodingKey {
        case power
        case accuracy
        case pp
        case effectEntries = "effect_entries"
    }
    
    var effectString: String? {
        var effectEntriesEn: EffectModel?
        
        effectEntriesEn = effectEntries.first
        
        if let effectEntriesEn = effectEntriesEn {
            return effectEntriesEn.effect
        } else {
            return nil
        }
    }
}

struct EffectModel: Codable {
    let effect: String?
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


