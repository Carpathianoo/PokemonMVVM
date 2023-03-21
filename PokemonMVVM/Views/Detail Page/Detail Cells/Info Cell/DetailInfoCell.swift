//
//  DetailInfoCell.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 16/03/23.
//

import UIKit

class DetailInfoCell: UITableViewCell {

    static let identifier = "DetailInfoCell"
    
    @IBOutlet weak var moveName: UILabel! {
        didSet {
            moveName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        }
    }
    @IBOutlet weak var movePower: UILabel! {
        didSet {
            movePower.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            movePower.textColor = .systemRed
        }
    }
    @IBOutlet weak var moveAcc: UILabel! {
        didSet {
            moveAcc.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            moveAcc.textColor = .systemGray3
        }
    }
    @IBOutlet weak var movePp: UILabel! {
        didSet {
            movePp.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            movePp.textColor = .blue
        }
    }
    
    @IBOutlet weak var DescLabel: UILabel! {
        didSet {
            DescLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(move: MoveModel) {
        self.moveName.text = move.name.capitalized
        
        if move.moveDetail?.power == 0 {
            
        }
        self.movePower.text = "Power:\(move.moveDetail?.power ?? 0)"
        self.moveAcc.text = "Acc:\(move.moveDetail?.accuracy ?? 0)"
        self.movePp.text = "Pp:\(move.moveDetail?.pp ?? 0)"

        if let effect = move.moveDetail?.effectString {
           
            self.DescLabel.text = effect
        }
    }
    
}
