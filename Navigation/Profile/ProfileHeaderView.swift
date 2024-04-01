//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий on 31.03.2024.
//

import UIKit
class ProfileHeaderView: UIView {

    var labelFIO = UILabel(
        frame:
            CGRect(
            x: 10,
            y: 10,
            width: 50,
            height: 10
            )
    )

    func sss () {
        self.labelFIO.backgroundColor = .red
        return self.addSubview(labelFIO)
    }
}


