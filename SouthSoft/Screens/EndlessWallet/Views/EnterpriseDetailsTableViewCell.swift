//
//  EnterpriseDetailsTableViewCell.swift
//  EWallet
//
//  Created by Appventurez on 25/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class EnterpriseDetailsTableViewCell: UITableViewCell {
    static let reuseId = "EnterpriseDetailsTableViewCell"
    
    @IBOutlet weak var enterpriseDetailsButton:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction fileprivate func enterpriseDetailsButtonAction(_ sender:UIButton) {
        
    }
    
}
