//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий on 31.03.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView ()

    override func viewDidLoad() {
        view.backgroundColor = .lightGray

        profileHeaderView = ProfileHeaderView ()
        profileHeaderView.backgroundColor = .yellow

        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(myButton2)
        myConstraintSetup ()
        super.viewDidLoad()
    }

    lazy var myButton2: UIButton = {
        let button2 = UIButton ()
        button2.backgroundColor = UIColor.systemRed
        button2.layer.cornerRadius = 4
        button2.setTitle("Кнопка 2", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button2.layer.borderColor = UIColor.red.cgColor
        button2.layer.shadowOffset.width = 3
        button2.layer.shadowOffset.height = 4
        button2.layer.shadowRadius = 4
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOpacity = 0.7
        button2.addTarget(self, action: #selector(mybuttonAction2), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false

        return button2
    }()

    @objc func mybuttonAction2() {
        print("Button2")
    }

    func myConstraintSetup () {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            profileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            myButton2.topAnchor.constraint(equalTo: myButton2.bottomAnchor, constant: -30),
            myButton2.bottomAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: -1),
            myButton2.leftAnchor.constraint(equalTo: profileHeaderView.leftAnchor, constant: 0),
            myButton2.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: 0)
        ])
    }
}
