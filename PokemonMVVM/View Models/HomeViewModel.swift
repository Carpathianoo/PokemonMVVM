//
//  HomeViewModel.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 15/03/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var urlString: String { get }
    var bindPokemonData: ((Pokemon?) -> ())? { get set }
    func fetchPokemonData()
}


class HomeViewModel: HomeViewModelProtocol {
    var urlString: String
    private var apiServiceProtocol: ApiServiceProtocol?
    var pokemonData: Pokemon?
    
    var bindPokemonData: ((Pokemon?) -> ())?
    
    init(urlString: String, apiServiceProtocol: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiServiceProtocol = apiServiceProtocol
        if let url = URL(string: urlString){
            self.apiServiceProtocol?.get(url: url)
        }
        fetchPokemonData()
    }
    
    
    
    func fetchPokemonData() {
        self.apiServiceProtocol?.callApi(model: Pokemon.self, completion: { response in
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
