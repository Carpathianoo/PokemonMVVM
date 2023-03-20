//
//  DetailHeaderCell.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 16/03/23.
//

import UIKit
import SDWebImage

class DetailHeaderCell: UITableViewCell {

    static let identifier = "DetailHeaderCell"
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonHp: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(detailModel: PokemonDetail) {
        self.pokemonName.text = detailModel.name
        self.pokemonImage.sd_setImage(with: URL(string: detailModel.sprites.other.home.frontDefault))
        self.pokemonHp.text = "\(detailModel.stats[0].baseStat)Hp"
    }
    
}
