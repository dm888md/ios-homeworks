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
 
//начал делать второе задание
        view.backgroundColor = .lightGray

        profileHeaderView = ProfileHeaderView ()

        view.addSubview(profileHeaderView)
        self.profileHeaderView.addSubview(profileHeaderView.fullNameLabel)
    }


    override func viewWillLayoutSubviews () {
        super.viewWillLayoutSubviews ()
        profileHeaderView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: view.frame.size.height)


    }


}

