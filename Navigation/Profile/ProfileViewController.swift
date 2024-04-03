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
        let fullNameLabelTopAnchor = profileHeaderView.fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27)
        let fullNameLabelCenter = profileHeaderView.fullNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
  
//        Поле со статусом - готово
        let stastusLabelTopAnchor = profileHeaderView.statusLabel.bottomAnchor.constraint(equalTo: profileHeaderView.myButton.topAnchor, constant: -34)
        let stastusLabelCenter = profileHeaderView.statusLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)

//        Настройка фото
        let myFotoTopAnchor = profileHeaderView.myFoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        let myFotoLeftAnchor = profileHeaderView.myFoto.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16)

//        Настройка кнопки
        let myButtomTopAnchor = profileHeaderView.myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        let myButtonLeftAnchor = profileHeaderView.myButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)

        profileHeaderView.myButton.frame = CGRect(x: 16, y: 50 + 16+16+profileHeaderView.myFoto.frame.height, width: 300, height: 50)

        profileHeaderView.myFoto.frame = CGRect(x: 20 + 16, y: 100 + 16, width: profileHeaderView.myFoto.frame.width, height: profileHeaderView.myFoto.frame.height)
//


        NSLayoutConstraint.activate([fullNameLabelTopAnchor, fullNameLabelCenter, stastusLabelTopAnchor,stastusLabelCenter, myFotoTopAnchor, myFotoLeftAnchor, myButtomTopAnchor, myButtonLeftAnchor])

    }

//    override func viewWillLayoutSubviews () {
//        super.viewWillLayoutSubviews ()
//        profileHeaderView.frame = CGRect(
//            x: 0,
//            y: 0,
//            width: view.frame.size.width - 20,
//            height: view.frame.size.height - 20)
//    }
//   
    override func viewWillLayoutSubviews () {
        super.viewWillLayoutSubviews ()
        profileHeaderView.frame = view.frame
    }




    
}

