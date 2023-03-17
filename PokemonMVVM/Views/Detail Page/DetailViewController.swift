//
//  DetailViewController.swift
//  PokemonMVVM
//
//  Created by Adlan Nourindiaz on 16/03/23.
//

import UIKit

enum Sections: Int {
    
    case header = 0
    case info = 1
    
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTable: UITableView!
    
    var detailUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("detail url: \(detailUrl)")
        setupTable()
    }
    
    
    func setupTable() {
        detailTable.delegate = self
        detailTable.dataSource = self
        detailTable.register(UINib(nibName: "DetailHeaderCell", bundle: nil), forCellReuseIdentifier: DetailHeaderCell.identifier)
        detailTable.register(UINib(nibName: "DetailInfoCell", bundle: nil), forCellReuseIdentifier: DetailInfoCell.identifier)

    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sections = Sections(rawValue: indexPath.section)
        
        switch sections {
        case .header:
            guard let cell = detailTable.dequeueReusableCell(withIdentifier: DetailHeaderCell.identifier) as? DetailHeaderCell else { return UITableViewCell() }

            return cell
        case .info:
            guard let cell = detailTable.dequeueReusableCell(withIdentifier: DetailInfoCell.identifier) as? DetailInfoCell else { return UITableViewCell() }

            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
