//
//  SideMenuTableViewCell.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/23/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    static let reuseId = "SideMenuTableViewCell"
    private let proButtonMaxWidth:CGFloat = 36
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet private weak var proButtonWidth: NSLayoutConstraint!
    @IBOutlet private weak var proButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    private func setupUI(){
        arrow.transform = CGAffineTransform(rotationAngle: -CGFloat.pi);
        proButton.layer.cornerRadius = 8.0
    }
    
    func setProButtonHidden(_ isHidden: Bool){
        proButtonWidth.constant = isHidden ? 0.0 : proButtonMaxWidth
    }
}
