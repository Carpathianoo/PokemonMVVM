//
//  ViewController.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 15/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var pokemonList: UICollectionView!
    
    var homeVM: HomeViewModel?
    private var pokemonData: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupList()
        callApi()
        
    }

    func callApi() {
        self.homeVM = HomeViewModel(apiServiceProtocol: ApiService())
        
        self.homeVM?.bindPokemonData = { pokemonModel in
            
            if let model = pokemonModel {
                self.pokemonData = model
            }
            DispatchQueue.main.async {
                self.pokemonList.reloadData()
            }
            
        }
        
    }
    
    func setupList() {
        pokemonList.dataSource = self
        pokemonList.delegate = self
        pokemonList.register(UINib(nibName: "PokemonListCell", bundle: nil), forCellWithReuseIdentifier: PokemonListCell.identifier)
    }
    
    
    func moveToDetailPage(index: Int) {
        let vc = DetailViewController()
        vc.detailUrl = self.pokemonData?.results[index].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.view.frame.width / 5, height: self.pokemonList.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var count = self.pokemonData?.results.count ?? 0
        print(count)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = pokemonList.dequeueReusableCell(withReuseIdentifier: PokemonListCell.identifier, for: indexPath) as? PokemonListCell else { return UICollectionViewCell() }
        cell.setupCell()
        
        guard let pokemon = pokemonData?.results[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(pokemon: pokemon, imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(indexPath.row+1).png")
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveToDetailPage(index: indexPath.row)
    }
}


