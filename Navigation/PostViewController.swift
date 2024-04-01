//
//  PostViewController.swift
//  Navigation
//
//  Created by Дмитрий on 22.03.2024.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "Anonymous"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.title = titlePost

// Добавили кнопку на панель
        let barButton = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(barButtonAction)
        )

        navigationItem.rightBarButtonItem = barButton

    }
    @objc func barButtonAction(sender: UIBarButtonItem) {
        let infoViewController = InfoViewController()
        infoViewController.modalTransitionStyle = .coverVertical
        present(infoViewController, animated: true, completion: nil)
    }
}
