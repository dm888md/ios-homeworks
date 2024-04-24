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

    lazy  var myButton: UIButton = {
        let button = UIButton ()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        button.layer.shadowOffset.width = 3
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(mybuttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func mybuttonAction(sender: UIButton) {
        print(statusLabel.text ?? "No text")
    }

    lazy  var myButton2: UIButton = {
        let button2 = UIButton ()
        button2.backgroundColor = .yellow
        button2.layer.cornerRadius = 4
        button2.setTitle("Кнопка 2", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button2.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        button2.layer.shadowOffset.width = 3
        button2.layer.shadowOffset.height = 4
        button2.layer.shadowRadius = 4
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOpacity = 0.7
        //        button.addTarget(self, action: #selector(mybuttonAction), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()

    let myFoto: UIImageView = {
        let foto = UIImageView ()
        foto.image = UIImage(named: "profileimage")
        foto.frame = CGRect(x: 16, y: 16, width: 90, height: 90)
        foto.layer.cornerRadius = 50
        foto.clipsToBounds = true
        foto.layer.borderColor = UIColor.white.cgColor
        foto.layer.borderWidth = 3
        foto.translatesAutoresizingMaskIntoConstraints = false
        return foto
    }()

    let statusTextField: UITextField = {
        let statusText = UITextField ()
        statusText.frame = CGRect(x: 75, y: 75, width: 200, height: 100)
        statusText.text = "Здесь расположен текст статуса"
        statusText.font = UIFont.boldSystemFont(ofSize: 20)
        statusText.textColor = .blue
        statusText.translatesAutoresizingMaskIntoConstraints = false
        return statusText
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        myAddViewSetyp ()
        myConstrainSetup ()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func myAddViewSetyp () {
        self.addSubview(fullNameLabel)
        self.addSubview(myFoto)
        self.addSubview(myButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(myButton2)
    }


    func myConstrainSetup () {

        translatesAutoresizingMaskIntoConstraints = false

        autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleBottomMargin]

        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            statusLabel.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: -34),
            statusLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            statusTextField.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 50),
            statusTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            myFoto.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,constant: 16),
            myFoto.rightAnchor.constraint(equalTo: myFoto.leftAnchor, constant: 100),
            myFoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            myFoto.bottomAnchor.constraint(equalTo: myFoto.topAnchor, constant: 100),

            myButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,constant: 16),
            myButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            myButton.topAnchor.constraint(equalTo: myFoto.bottomAnchor, constant: 16),
            myButton.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: 50),

            myButton2.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,constant: 16),
            myButton2.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            myButton2.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 50),
            myButton2.bottomAnchor.constraint(equalTo: myButton2.topAnchor, constant: 50)
        ])
    }
}
