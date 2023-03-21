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
    var pokemonDetail: PokemonDetail?

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
            switch response {
            case .success(let data):
                
                let group = DispatchGroup()
                self.pokemonDetail = data
                let moves = data.moves
                
                for (index, move) in moves.enumerated() {
                    group.enter()
                    self.getMoveDetail(url: move.move.url) { moveDetail in
                        self.pokemonDetail?.moves[index].move.moveDetail = moveDetail
                        group.leave()
                    }
                }
                
                group.notify(queue: .main) {
                    self.delegate?.fetchDetail(pokemonDetail: self.pokemonDetail, error: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.fetchDetail(pokemonDetail: nil, error: error)
            }
        })
    }
    
    func getMoveDetail(url: String, completion: @escaping (MoveDetailModel?) -> Void) {
        apiServiceProtocol?.callApi(url: url, model: MoveDetailModel.self, completion: { response in
            switch response {
            case .success(let moveDetail):
                return completion(moveDetail)

            case .failure(let error):
                print(error.localizedDescription)
                return completion(nil)
            }
        })
        
    }
    
}
