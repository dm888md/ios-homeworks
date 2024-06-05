//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий on 31.03.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    fileprivate let data = MyPost.make() // база данных постов
    var profileHeaderView = ProfileHeaderView ()

    //     Создали экземпляр таблицы
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

    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        profileHeaderView.backgroundColor = .red
        view.addSubview(profileHeaderView)
        view.addSubview(tableView)
        myConstraintSetup ()
        tuneTableView ()
        super.viewDidLoad()
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

    func myConstraintSetup () {
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            profileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
        UITableView.automaticDimension
    }

    // Высота футера
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }



    //===============
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let dddd = ProfileHeaderView ()
        if section == 0 {
            return dddd
        }
        return nil
    }

        func tableView(
            _ tableView: UITableView,
            estimatedHeightForHeaderInSection section: Int
        ) -> CGFloat {
            UITableView.automaticDimension
    
        }
//    ===============


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
