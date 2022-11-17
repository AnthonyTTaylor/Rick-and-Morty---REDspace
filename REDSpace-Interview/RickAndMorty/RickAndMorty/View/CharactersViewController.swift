//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import UIKit

class CharactersViewController: UIViewController {
    
    lazy var searchBar = UISearchBar(frame: .zero)
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    
    var charactersArray : [CharacterModel] = []
    var filteredArray: [CharacterModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        let networkService = NetworkService()
        networkService.getCharacters { characters, error in
            self.charactersArray = characters
            self.filteredArray = self.charactersArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        searchBar.placeholder = "Search..."
        navigationItem.titleView = searchBar
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
        
        self.view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        self.tableView.register(CharacterCell.self, forCellReuseIdentifier: "characterCell")
    }
    
    
    func setUpNavigation() {
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    
    
}


extension CharactersViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterCell
        if cell == nil {
            cell = CharacterCell(style: .default, reuseIdentifier: "characterCell")
        }
        let character : CharacterModel = self.filteredArray[indexPath.row]
        cell?.titleLabel.text = character.name
        cell?.epsiodeCount.text = String(character.episode.count)
        cell?.thumbnail.imageFromServerURL(urlString: character.image, PlaceHolderImage: UIImage(named: "portal")!)
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailedCharacterViewController(selectedCharacter: self.filteredArray[indexPath.row])
        self.navigationController?.present(vc, animated: true)
    }
    
    
}

extension CharactersViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CharactersViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count != 0 {
            self.filteredArray = self.charactersArray.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.filteredArray = self.charactersArray
        self.tableView.reloadData()
    }
}
