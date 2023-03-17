//
//  HomeViewModel.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 15/03/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var bindPokemonData: ((Pokemon?) -> ())? { get set }
    func fetchPokemonData()
}

class HomeViewModel: HomeViewModelProtocol {
    private var urlString: String = "https://pokeapi.co/api/v2/pokemon?limit=1000"
    private var apiServiceProtocol: ApiServiceProtocol?
    var pokemonData: Pokemon?
    
    
    var bindPokemonData: ((Pokemon?) -> ())?
    
    init(apiServiceProtocol: ApiServiceProtocol) {
        self.apiServiceProtocol = apiServiceProtocol
        if let url = URL(string: urlString){
            self.apiServiceProtocol?.get(url: url)
        }
        fetchPokemonData()
    }
        
    
    
    func fetchPokemonData() {
        self.apiServiceProtocol?.callApi(url: self.urlString, model: Pokemon.self, completion: { response in
            switch response {
            case .success(let success):
                print(success)
                self.bindPokemonData?(success)
            case .failure(_):
                self.bindPokemonData?(nil)
            }
        })
        
    }
    
    
    
}
