//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий on 31.03.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    fileprivate let data = MyPost.make() // база данных постов
    fileprivate let profileHeaderView = ProfileHeaderView ()

    //     Создали экземпляр таблицы
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
//            style: .plain
            style: .grouped
//            style: .insetGrouped
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // Описывает виды ячеек
    private enum CellReuseId: String {
        case base = "BaseTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
        case head = "HeaderTableViewCell_ReuseID"
    }

    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        view.addSubview(tableView)
        myConstraintSetup ()
        tuneTableView ()
        super.viewDidLoad()
    }

    func tuneTableView () {
        ////         автоматический размер ячейки
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
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

    func myConstraintSetup () {
        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),


            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.widthAnchor.constraint(equalToConstant: view.frame.width),

            profileHeaderView.fullNameLabel.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            profileHeaderView.fullNameLabel.centerXAnchor.constraint(equalTo: profileHeaderView.centerXAnchor),

            profileHeaderView.myFoto.leftAnchor.constraint(equalTo: profileHeaderView.leftAnchor,constant: 16),
            profileHeaderView.myFoto.rightAnchor.constraint(equalTo: profileHeaderView.myFoto.leftAnchor, constant: 100),
            profileHeaderView.myFoto.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileHeaderView.myFoto.bottomAnchor.constraint(equalTo: profileHeaderView.myFoto.topAnchor, constant: 100),

            profileHeaderView.myButton.leftAnchor.constraint(equalTo: profileHeaderView.leftAnchor,constant: 16),
            profileHeaderView.myButton.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
            profileHeaderView.myButton.topAnchor.constraint(equalTo: profileHeaderView.myFoto.bottomAnchor, constant: 16),
            profileHeaderView.myButton.bottomAnchor.constraint(equalTo: profileHeaderView.myButton.topAnchor, constant: 50),

            profileHeaderView.statusLabel.bottomAnchor.constraint(equalTo: profileHeaderView.myButton.topAnchor, constant: -44),
            profileHeaderView.statusLabel.centerXAnchor.constraint(equalTo: profileHeaderView.centerXAnchor),


            profileHeaderView.statusTextField.topAnchor.constraint(equalTo: profileHeaderView.statusLabel.bottomAnchor, constant: 2),
            profileHeaderView.statusTextField.bottomAnchor.constraint(equalTo: profileHeaderView.statusTextField.topAnchor, constant: 40),
            profileHeaderView.statusTextField.leftAnchor.constraint(equalTo: profileHeaderView.statusLabel.leftAnchor, constant: 0),
            profileHeaderView.statusTextField.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
        ])
    }
}

extension ProfileViewController: UITableViewDelegate {

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
        //    return 150
        UITableView.automaticDimension
    }

    // Высота футера
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {

        if tableView.numberOfSections == 1 {
            _ = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: CellReuseId.head.rawValue)
            return profileHeaderView
        } else {
            return nil
        }

    }
}

extension ProfileViewController: UITableViewDataSource {

    //Количество секций в таблице
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        1
    }

    //Количество строк в секции
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        //        return 4
        return data.count
    }


    // Настройка ячеек и данные для из заполнения
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
