//
//  InfoViewController.swift
//  Navigation
//
//  Created by Дмитрий on 23.03.2024.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal

        
            let alertButton = UIButton ()
            alertButton.backgroundColor = .blue
            alertButton.layer.cornerRadius = 5
            alertButton.setTitle("Alert ", for: .normal)
            alertButton.setTitleColor(.lightGray, for: .normal)
            alertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            alertButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            //            button.translatesAutoresizingMaskIntoConstraints = false
            alertButton.frame = CGRect(x: 50, y: 200, width: 300, height: 50)

        view.addSubview(alertButton)
    }

    @objc func buttonAction(sender: UIButton) {
        let alert = UIAlertController(title: "Внимание, внимание!", message: "Да или нет", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            print("Нажали ДА")
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { action in
            print("Нажали НЕТ")
        }))

        self.present(alert, animated: true)

    }
}
