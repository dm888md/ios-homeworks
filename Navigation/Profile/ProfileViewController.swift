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
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        profileHeaderView = ProfileHeaderView ()
        view.addSubview(profileHeaderView)
    }
    override func viewWillLayoutSubviews () {
            profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
            super.viewWillLayoutSubviews ()
        }
    
}
