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
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()

    @objc func mybuttonAction(sender: UIButton) {
        print(statusLabel.text ?? "No text")
    }

    let myFoto: UIImageView = {
        let foto = UIImageView ()
        foto.image = UIImage(named: "profileImage")
        foto.frame = CGRect(x: 16, y: 160, width: 120, height: 120)
        foto.layer.cornerRadius = 60
        foto.clipsToBounds = true
        foto.layer.borderColor = UIColor.white.cgColor
        foto.layer.borderWidth = 3
        foto.translatesAutoresizingMaskIntoConstraints = true
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

        self.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin]
        
        self.addSubview(fullNameLabel)
        self.addSubview(myFoto)
        self.addSubview(myButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)

        let fullNameLabelTopAnchor = fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)

        let fullNameLabelCenterAnchor = fullNameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0)

        self.myFoto.frame = CGRect(
            x: safeAreaLayoutGuide.layoutFrame.minX + 16,
            y: safeAreaLayoutGuide.layoutFrame.minY + 16,
            width: myFoto.frame.width,
            height: myFoto.frame.height
        )

        self.myButton.frame = CGRect(
            x: safeAreaLayoutGuide.layoutFrame.minX + 16,
            y: myFoto.frame.maxY + 16,
            width: 360,
            height: 50
            )

        let statusLabelBottonAnchor = statusLabel.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: -16)

        let statusLabelCenterAnchor = statusLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)

        let statusTextFieldTopAnchor = statusTextField.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 50)

        let statusTextFieldLeftAnchor = statusTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16)

        let statusTextFieldRightAnchor = statusTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
            fullNameLabelTopAnchor,
            fullNameLabelCenterAnchor,
            statusLabelBottonAnchor,
            statusLabelCenterAnchor,
            statusTextFieldTopAnchor,
            statusTextFieldLeftAnchor,
            statusTextFieldRightAnchor
        ])
    }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

}
