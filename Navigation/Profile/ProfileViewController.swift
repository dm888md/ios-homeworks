//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий on 31.03.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView ()

    lazy  var myButton2: UIButton = {
        let button = UIButton ()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 4
        button.setTitle("Кнопка 2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        button.layer.shadowOffset.width = 3
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
//        button.addTarget(self, action: #selector(mybuttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        profileHeaderView = ProfileHeaderView ()
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(myButton2)

        self.myButton2.frame = CGRect(
            x: view.safeAreaLayoutGuide.layoutFrame.minX + 16,
            y: view.safeAreaLayoutGuide.layoutFrame.maxY - myButton2.frame.height - 200,
            width: view.safeAreaLayoutGuide.layoutFrame.width - 32,
            height: 50)
    }

    override func viewWillLayoutSubviews () {
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame

        let profileHeaderHeightAnchor: () = profileHeaderView.heightAnchor.constraint(equalToConstant: 200).isActive = true


//        let profileHeaderViewTopAnchor: () =
//        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//
//        let profileHeaderViewBottonAnchor: () =
//        profileHeaderView.bottomAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 200).isActive = true
//
//        let profileHeaderViewLeffAnchor: () =
//        profileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
//
//        let profileHeaderViewRightAnchor: () =
//        profileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
//
        super.viewWillLayoutSubviews ()
        }
}
