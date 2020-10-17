//
//  FDICInsuranceTableViewCell.swift
//  EWallet
//
//  Created by Appventurez on 25/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class FDICInsuranceTableViewCell: UITableViewCell {

    static let reuseId = "FDICInsuranceTableViewCell"

    @IBOutlet weak var yesButton:UIButton!
    @IBOutlet weak var noButton:UIButton!
    @IBOutlet weak var insuranceLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction fileprivate func yesButtonAction(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setTitleColor(AppColors.themeLightYellow, for: .normal)
            sender.setImage(UIImage(named: "SelectedBtn"), for: .normal)
            noButton.setTitleColor(.white, for: .normal)
            noButton.setImage(UIImage(named: "UnselectedBtn"), for: .normal)
            noButton.isSelected = false

        }
        else {
            sender.setTitleColor(.white, for: .normal)
            sender.setImage(UIImage(named: "UnselectedBtn"), for: .normal)
        }

    }

    @IBAction fileprivate func noButtonAction(_ sender:UIButton) {

        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setTitleColor(AppColors.themeLightYellow, for: .normal)
            sender.setImage(UIImage(named: "SelectedBtn"), for: .normal)
            yesButton.setTitleColor(.white, for: .normal)
            yesButton.setImage(UIImage(named: "UnselectedBtn"), for: .normal)
            yesButton.isSelected = false

        }
        else {
            sender.setTitleColor(.white, for: .normal)
            sender.setImage(UIImage(named: "UnselectedBtn"), for: .normal)
        }

    }
}
