//
//  SocialConnectionTableViewCell.swift
//  EWallet
//
//  Created by Appventurez on 25/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class SocialConnectionTableViewCell: UITableViewCell {
    static let reuseId = "SocialConnectionTableViewCell"


    @IBOutlet fileprivate weak var instagramBtn:UIButton!
    @IBOutlet fileprivate weak var facebookBtn:UIButton!
    @IBOutlet fileprivate weak var snapchatBtn:UIButton!
    @IBOutlet fileprivate weak var linkedInBtn:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction fileprivate func instagramBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func facebookBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func snapchatBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func linkedInBtnAction(_ sender:UIButton) {

    }
    
}
