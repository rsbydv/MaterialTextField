//
//  OutstandingLoansTableCell.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/23/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class OutstandingLoansTableCell: UITableViewCell {
    
    static let reuseId = "OutstandingLoansTableCell"

    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    private func setup(){
        containerView.layer.cornerRadius = 25
    }
    
}
