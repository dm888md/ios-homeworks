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
        profileHeaderView.backgroundColor = .blue
        view.addSubview(profileHeaderView)
    }

    override func viewWillLayoutSubviews () {
        super.viewWillLayoutSubviews ()
        profileHeaderView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: view.frame.size.height
        )
            }
}

