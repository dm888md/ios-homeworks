//
//  FeedViewController.swift
//  Navigation
//
//  Created by Дмитрий on 22.03.2024.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Новая новость")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        let button = UIButton ()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.setTitle("Новости", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 200, width: 300, height: 50)

        view.addSubview(button)
    }

    @objc func buttonAction(sender: UIButton) {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title

        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}
