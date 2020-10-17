//
//  TableTitleHeaderView.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/23/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class TableTitleHeaderView: UIView {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetUp()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewSetUp()
    }
    
    private func viewSetUp() {
        self.backgroundColor = AppColors.themeBackground
        
        label = UILabel.init()
        label.numberOfLines = 0
        label.font = AppFonts.tableView.headerLabel
        label.textColor = .white
        label.text = ""

        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
}
