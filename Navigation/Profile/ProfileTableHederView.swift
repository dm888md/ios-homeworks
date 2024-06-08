//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Дмитрий on 13.05.2024.
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
        label.textColor = .red
        label.text = "Waiting for something..."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton ()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.layer.shadowOffset.width = 3
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(mybuttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let myFoto: UIImageView = {
        let foto = UIImageView ()
        foto.image = UIImage(named: "profileimage")
        foto.layer.cornerRadius = 50
        foto.clipsToBounds = true
        foto.layer.borderColor = UIColor.white.cgColor
        foto.layer.borderWidth = 3
        foto.translatesAutoresizingMaskIntoConstraints = false
        return foto
    }()
    
    let statusTextField: UITextField = {
        let statusText = UITextField ()
        statusText.placeholder = "Listening for music"
        statusText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusText.textColor = .black
        statusText.layer.borderColor = UIColor.black.cgColor
        statusText.layer.borderWidth = 1
        statusText.layer.cornerRadius = 12
        statusText.layer.backgroundColor = UIColor.white.cgColor
        statusText.translatesAutoresizingMaskIntoConstraints = false
        return statusText
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        myAddViewSetyp ()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // добавляем view на экран
    func myAddViewSetyp () {
        self.addSubview(fullNameLabel)
        self.addSubview(myFoto)
        self.addSubview(myButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
    }
    
    @objc func mybuttonAction(sender: UIButton) {
        print(statusLabel.text ?? "No text")
    }
}
