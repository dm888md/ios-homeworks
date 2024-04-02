//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий on 31.03.2024.
//

import UIKit
class ProfileHeaderView: UIView {


    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster Cat"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label


    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        label.textColor = .gray
        label.textColor = .red
        label.text = "Waiting for something..."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let myButton: UIButton = {
        let button = UIButton ()
//        button.titleLabel = "Show status"
//        button.tintColor = .blue


        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)


        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 200, width: 300, height: 50)

//        view.addSubview(button)



        return button

    }()

}


