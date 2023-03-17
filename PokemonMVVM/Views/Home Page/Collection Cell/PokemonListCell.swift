//
//  PokemonListCell.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 15/03/23.
//

import UIKit
import SDWebImage
import SkeletonView


class PokemonListCell: UICollectionViewCell {

    static let identifier = "PokemonListCell"
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell() {
        self.pokemonImage.showGradientSkeleton()
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
    }
    
    func configure(pokemon: BaseData, imageUrl: String) {
        self.pokemonName.text = pokemon.name
        self.pokemonImage.sd_setImage(with: URL(string: imageUrl))
//        let url = URL(string: imageUrl)
//
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                self.pokemonImage.image = UIImage(data: data!)
//                }
//        }
    }
    
}
