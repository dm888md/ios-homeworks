//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий on 18.05.2024.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    private let myAuthor: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myDescription: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myImage: UIImageView = {
        let label = UIImageView ()
        label.contentMode = .scaleAspectFill
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myLikes: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myViews: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
        addView ()
        myConstrain ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    
    private func addView () {
        addSubview(myAuthor)
        addSubview(myDescription)
        addSubview(myImage)
        addSubview(myLikes)
        addSubview(myViews)
    }
    
    func configure(with mypost: MyPost) {
        myAuthor.text = mypost.author
        myDescription.text = mypost.description
        myImage.image = UIImage(named: mypost.image)
        myLikes.text = "Likes:" + String.init(mypost.likes)
        myViews.text = "Views:" + String.init(mypost.views)
    }
    
    func myConstrain () {
        NSLayoutConstraint.activate([

            myAuthor.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            myAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            myAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            myImage.topAnchor.constraint(equalTo: myAuthor.bottomAnchor, constant: 10),
            myImage.widthAnchor.constraint(equalTo: widthAnchor),
            myImage.heightAnchor.constraint(equalTo: myAuthor.widthAnchor),

            myDescription.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 16),
            myDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            myDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            myLikes.topAnchor.constraint(equalTo: myDescription.bottomAnchor, constant: 16),
            myLikes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            myLikes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: +16),
            myLikes.trailingAnchor.constraint(equalTo:myDescription.centerXAnchor ),
            
            myViews.topAnchor.constraint(equalTo: myDescription.bottomAnchor, constant: 16),
            myViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            myViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            myViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}

