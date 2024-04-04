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
        self.profileHeaderView.addSubview(profileHeaderView.statusLabel)
        self.profileHeaderView.addSubview(profileHeaderView.myButton)
        self.profileHeaderView.addSubview(profileHeaderView.myFoto)



// Поле с именем - готово
        let fullNameLabelTopAnchor: () = profileHeaderView.fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        let fullNameLabelCenter: () = profileHeaderView.fullNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

//        Поле со статусом - готово
        let stastusLabelTopAnchor: () = profileHeaderView.statusLabel.bottomAnchor.constraint(equalTo: profileHeaderView.myButton.topAnchor, constant: -34).isActive = true
        let stastusLabelCenter: () = profileHeaderView.statusLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        profileHeaderView.myFoto.frame = CGRect(
            x: self.view.frame.minX + 16,
            y: self.view.frame.minY + 100 + 16, // не получается задать коордиты от safeAreaLayoutGuide
            width: profileHeaderView.myFoto.frame.width,
            height: profileHeaderView.myFoto.frame.height)

        profileHeaderView.myButton.frame = CGRect(
            x: self.view.frame.minX + 16,
            y: self.profileHeaderView.myFoto.frame.maxY + 10,
            width: self.view.frame.width - 32,
            height: profileHeaderView.myButton.frame.height)



//        NSLayoutConstraint.activate([fullNameLabelTopAnchor, fullNameLabelCenter, stastusLabelTopAnchor,stastusLabelCenter, myFotoTopAnchor, myFotoLeftAnchor, myButtomTopAnchor, myButtonLeftAnchor, myButtonRightAnchor])

    }

//    override func viewWillLayoutSubviews () {
//        super.viewWillLayoutSubviews ()
//        profileHeaderView.frame = CGRect(
//            x: profileHeaderView.frame.minX,
//            y: profileHeaderView.frame.minY,
//            width: view.frame.size.width - 20,
//            height: view.frame.size.height - 20)
//    }
   
    override func viewWillLayoutSubviews () {
        profileHeaderView.frame = view.frame
        super.viewWillLayoutSubviews ()

    }

}

