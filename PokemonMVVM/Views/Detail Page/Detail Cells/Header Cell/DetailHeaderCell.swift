//
//  DetailHeaderCell.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 16/03/23.
//

import UIKit

class DetailHeaderCell: UITableViewCell {

    static let identifier = "DetailHeaderCell"
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonHp: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
