//
//  DetailedCharacterViewController.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import UIKit

class DetailedCharacterViewController: UIViewController {
    
    let selectedCharacter : CharacterModel?
    
    private var photo : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 180/2
        img.clipsToBounds = true
        return img
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow
        return tableView
        
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    private var name:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var status:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var species:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var gender:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var currentLocation:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(selectedCharacter: CharacterModel) {
        self.selectedCharacter = selectedCharacter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //self.view.backgroundColor = .green
        assignbackground()
        configureSubviews()
        setupConstraints()
    }
    
    func configureSubviews() {
        guard let selectedCharacter = self.selectedCharacter else { return }
        self.view.addSubview(containerView)
        
        containerView.addSubview(photo)
        photo.imageFromServerURL(urlString: selectedCharacter.image , PlaceHolderImage: UIImage(named: "portal")!)
        
        
        containerView.addSubview(name)
        name.text = selectedCharacter.name
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textColor = .black
        
        self.view.addSubview(status)
        status.text = selectedCharacter.status
        status.font = UIFont.boldSystemFont(ofSize: 20)
        status.textColor = .black
        
        self.view.addSubview(species)
        species.text = selectedCharacter.species
        species.font = UIFont.boldSystemFont(ofSize: 20)
        species.textColor = .black
        
        self.view.addSubview(gender)
        gender.text = selectedCharacter.gender
        gender.font = UIFont.boldSystemFont(ofSize: 20)
        gender.textColor = .black
        
        self.view.addSubview(currentLocation)
        currentLocation.text = selectedCharacter.location.name
        currentLocation.font = UIFont.boldSystemFont(ofSize: 20)
        currentLocation.textColor = .black
    }
    
    func setupConstraints() {
        let defaultLeadingConstain :CGFloat = 8
        let defaulttrailingConstain :CGFloat = -8
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo:self.view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor,constant: defaultLeadingConstain),
            containerView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor,constant: defaultLeadingConstain),
            containerView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            
            photo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            photo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            photo.heightAnchor.constraint(equalToConstant: 180),
            photo.widthAnchor.constraint(equalToConstant: 180),
            
            name.topAnchor.constraint(equalTo: photo.bottomAnchor,constant: 8),
            name.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: defaultLeadingConstain),
            name.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: defaultLeadingConstain),
            name.heightAnchor.constraint(equalToConstant: 20),
            
            
            status.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 8),
            status.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: defaultLeadingConstain),
            status.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: defaultLeadingConstain),
            status.heightAnchor.constraint(equalToConstant: 20),
            
            species.topAnchor.constraint(equalTo: status.bottomAnchor,constant: 8),
            species.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: defaultLeadingConstain),
            species.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: defaultLeadingConstain),
            species.heightAnchor.constraint(equalToConstant: 20),
            
            gender.topAnchor.constraint(equalTo: species.bottomAnchor,constant: 8),
            gender.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: defaultLeadingConstain),
            gender.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: defaulttrailingConstain),
            gender.heightAnchor.constraint(equalToConstant: 20),
            
            currentLocation.topAnchor.constraint(equalTo: gender.bottomAnchor,constant: 8),
            currentLocation.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: defaultLeadingConstain),
            currentLocation.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: defaulttrailingConstain),
            currentLocation.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
    
    func assignbackground(){
        var background = UIImage(named: "wallpaper")
        background = background?.blur(8)
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}
