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
    var pokemonDetailData: PokemonDetail?
    private var detailViewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVM()
        setupTable()
    }
    
    func setupVM() {
        guard let url = self.detailUrl else { return }
        detailViewModel = DetailViewModel(url: url)
        detailViewModel?.delegate = self
        detailViewModel?.getDetail()
//        pokemonDetailData = detailViewModel?.pokemonDetail
    }
    
    func setupTable() {
        detailTable.delegate = self
        detailTable.dataSource = self
        detailTable.register(UINib(nibName: "DetailHeaderCell", bundle: nil), forCellReuseIdentifier: DetailHeaderCell.identifier)
        detailTable.register(UINib(nibName: "DetailInfoCell", bundle: nil), forCellReuseIdentifier: DetailInfoCell.identifier)

    }
    
}

extension DetailViewController: DetailViewModelProtocol {
    func fetchDetail(pokemonDetail: PokemonDetail?, error: Error?) {
        if let pokemonDetail = pokemonDetail {
            self.pokemonDetailData = pokemonDetail
            DispatchQueue.main.async {
                self.detailTable.reloadData()
            }
        } else if let error = error {
            print(error.localizedDescription)
        }
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailData = pokemonDetailData else { return UITableViewCell() }
        
        let sections = Sections(rawValue: indexPath.section)
        
        switch sections {
        case .header:
            guard let cell = detailTable.dequeueReusableCell(withIdentifier: DetailHeaderCell.identifier) as? DetailHeaderCell else { return UITableViewCell() }

            cell.configure(detailModel: detailData)
            
            return cell
        case .info:
            guard let cell = detailTable.dequeueReusableCell(withIdentifier: DetailInfoCell.identifier) as? DetailInfoCell else { return UITableViewCell() }

            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
