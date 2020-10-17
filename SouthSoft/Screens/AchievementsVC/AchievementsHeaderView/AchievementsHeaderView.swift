//
//  AchievementsHeaderView.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/23/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class AchievementsHeaderView: UICollectionReusableView {

    static let reuseId = "AchievementsHeaderView"
    @IBOutlet weak var icon: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    public var animator: UIViewPropertyAnimator?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 25
        containerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateFrames()
    }
    
    fileprivate func updateFrames(){
        icon.layer.cornerRadius = icon.frame.height/2.0
    }
    
    // MARK:- add visual effect view
       private func addBlurVisulaEffectView() {
           
           animator = UIViewPropertyAnimator(duration: 4.0, curve: .easeInOut, animations: { [weak self] in
               guard let strongSelf = self else { return }
               
               let blurEffect = UIBlurEffect(style: .regular)
               let visulaEffectView = UIVisualEffectView(effect: blurEffect)
               visulaEffectView.translatesAutoresizingMaskIntoConstraints = false
               strongSelf.addSubview(visulaEffectView)
               
               NSLayoutConstraint.activate([
                   visulaEffectView.topAnchor.constraint(equalTo: strongSelf.topAnchor, constant: 0),
                   visulaEffectView.leadingAnchor.constraint(equalTo: strongSelf.leadingAnchor, constant: 0),
                   visulaEffectView.bottomAnchor.constraint(equalTo: strongSelf.bottomAnchor, constant: 0),
                   visulaEffectView.trailingAnchor.constraint(equalTo: strongSelf.trailingAnchor, constant: 0)
                   ])
           })
       }
}

