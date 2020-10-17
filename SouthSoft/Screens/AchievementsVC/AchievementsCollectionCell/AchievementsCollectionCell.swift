//
//  AchievementsCollectionCell.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/23/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class AchievementsCollectionCell: UICollectionViewCell {
    
    static let reuseId = "AchievementsCollectionCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var background: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
