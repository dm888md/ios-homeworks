//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий on 31.03.2024.
//

import UIKit

// 03 удалить весь код надо удалить!!!!
class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView ()
    
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        myConstraintSetup ()
        super.viewDidLoad()
    }
    
    func myConstraintSetup () {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            profileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 500),
            profileHeaderView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),

        ])
    }
}



// 03 удалить весь код надо удалить!!!!
//class ProfileViewController: UIViewController {
//
//    var profileHeaderView = ProfileHeaderView ()
//
//    override func viewDidLoad() {
//        view.backgroundColor = .lightGray
//        view.addSubview(profileHeaderView)
////        myConstraintSetup ()
//        super.viewDidLoad()
//    }
//
//    func myConstraintSetup () {
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            profileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
//            profileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 500),
//        ])
//    }
//}
