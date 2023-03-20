//
//  DetailViewModel.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 16/03/23.
//

import Foundation

protocol DetailViewModelProtocol {
    func fetchDetail(pokemonDetail: PokemonDetail?, error: Error?)
}


class DetailViewModel {
    private var url: String
    private var apiServiceProtocol: ApiServiceProtocol?
//    var pokemonDetail: PokemonDetail?

    var delegate: DetailViewModelProtocol?

    
    init(url: String) {
        self.url = url
        self.apiServiceProtocol = ApiService()
        if let url = URL(string: url){
            self.apiServiceProtocol?.get(url: url)
        }
    }
    
    func getDetail() {
        apiServiceProtocol?.callApi(url: self.url, model: PokemonDetail.self, completion: { response in
//            print("detail url: \(self.url)")
            print("this is the detail data:\(response) ")

            switch response {
            case .success(let data):
//                self.pokemonDetail = data
                self.delegate?.fetchDetail(pokemonDetail: data, error: nil)
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.fetchDetail(pokemonDetail: nil, error: error)
            }
        })
    }
}
