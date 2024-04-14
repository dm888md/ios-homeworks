//
//  ProfileViewController.swift
//  Navigation
//
<<<<<<< HEAD
//  Created by Дмитрий on 30.03.2024.
=======
//  Created by Дмитрий on 31.03.2024.
>>>>>>> feature/iosui-2
//

import UIKit

class ProfileViewController: UIViewController {
<<<<<<< HEAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

}

=======

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
>>>>>>> feature/iosui-2
