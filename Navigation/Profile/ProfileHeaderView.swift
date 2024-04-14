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
        label.textColor = .gray
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(myFoto)
        self.addSubview(myButton)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)

        self.myFoto.frame = CGRect(
            x: safeAreaLayoutGuide.layoutFrame.minX + 16,
            y: safeAreaLayoutGuide.layoutFrame.minY + 16,
            width: self.myFoto.frame.width,
            height: self.myFoto.frame.height
        )

        self.myButton.frame = CGRect(
            x: safeAreaLayoutGuide.layoutFrame.minX + 16,
            y: myFoto.frame.maxY + 16,
            width: 360,
            height: 50
        )

        let statusLabelBottonAnchor = NSLayoutConstraint(
            item: statusLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: myButton,
            attribute: .top,
            multiplier: 1, constant: -16)

        let statusLabelCenterAnchor = NSLayoutConstraint(
            item: statusLabel,
            attribute: .centerX,
            relatedBy: .lessThanOrEqual,
            toItem: myButton,
            attribute: .centerX,
            multiplier: 1, constant: 0)

        let fullNameLabelBottonAnchor = NSLayoutConstraint(
            item: fullNameLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: safeAreaLayoutGuide,
            attribute: .top,
            multiplier: 1, constant: 16)

        let fullNameLabelCenterAnchor = NSLayoutConstraint(
            item: fullNameLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: safeAreaLayoutGuide,
            attribute: .centerX,
            multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([statusLabelBottonAnchor, statusLabelCenterAnchor, fullNameLabelBottonAnchor, fullNameLabelCenterAnchor])

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
