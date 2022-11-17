//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import UIKit

final class CharacterCell: UITableViewCell {
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  .black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let epsiodeCount:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var thumbnail : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewsAndlayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func prepareForReuse() {
        self.thumbnail.image = nil
    }
    
    func addSubViewsAndlayout() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(epsiodeCount)
        containerView.addSubview(thumbnail)
        

        
        
        NSLayoutConstraint.activate([
            
            //Container
            containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor),
            
            
            //Thumbnail
            thumbnail.centerYAnchor.constraint(equalTo:self.containerView.centerYAnchor),
            thumbnail.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant:10),
            thumbnail.widthAnchor.constraint(equalToConstant:70),
            thumbnail.heightAnchor.constraint(equalToConstant:70),
            
            //Title
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.leftAnchor.constraint(equalTo: self.thumbnail.rightAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24),
            
            //Episode Count
            epsiodeCount.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
            epsiodeCount.leftAnchor.constraint(equalTo: self.thumbnail.rightAnchor, constant: 12),
            epsiodeCount.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24),
            epsiodeCount.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10)
        ])
    }
}
