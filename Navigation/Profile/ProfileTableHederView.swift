//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Дмитрий on 13.05.2024.
//

import UIKit

class ProfileHeaderView: UIView {

    fileprivate let data = MyPost.make()

    // Создали экземпляр таблицы
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // Описывает виды ячеек
    private enum CellReuseId: String {
        case base = "BaseTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }

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
        myConstrainSetup ()
        tuneTableView ()
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
        self.addSubview(tableView)
    }

    @objc func mybuttonAction(sender: UIButton) {
        print(statusLabel.text ?? "No text")
    }

    func myConstrainSetup () {

        translatesAutoresizingMaskIntoConstraints = false

        autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleBottomMargin]

        NSLayoutConstraint.activate([

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            statusLabel.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: -44),
            statusLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            statusTextField.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: 40),
            statusTextField.leftAnchor.constraint(equalTo: statusLabel.leftAnchor, constant: 0),
            statusTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),

            myFoto.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,constant: 16),
            myFoto.rightAnchor.constraint(equalTo: myFoto.leftAnchor, constant: 100),
            myFoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            myFoto.bottomAnchor.constraint(equalTo: myFoto.topAnchor, constant: 100),

            myButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,constant: 16),
            myButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            myButton.topAnchor.constraint(equalTo: myFoto.bottomAnchor, constant: 16),
            myButton.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: 50),

            tableView.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            //            tableView.heightAnchor.constraint(equalToConstant: 100 ),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    func tuneTableView () {
        ////         автоматический размер ячейки
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseId.base.rawValue
        )
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseId.custom.rawValue
        )
    }
}

extension ProfileHeaderView: UITableViewDelegate {

    // высота ячеек
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        //        return 50
        UITableView.automaticDimension
    }

    //    Высота хэдера
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }

    // Высота футера
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ProfileHeaderView: UITableViewDataSource {
    //
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        1
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        //        return 4
        return data.count
    }

    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        "Пример работы - Хэдер"
    }

    func tableView(
        _ tableView: UITableView,
        titleForFooterInSection section: Int
    ) -> String? {
        "Пример работы - Футер"
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseId.base.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        
        let mypost = data[indexPath.row]
        cell.configure(with: mypost)
        return cell
    }
}
