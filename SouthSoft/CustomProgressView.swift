//
//  CustomProgressView.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/24/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit


class CustomProgressView: UIProgressView {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 8.0)
    }
    
    override var cornerRadius: CGFloat{
        didSet{
            for subview in subviews {
               if let imageView = subview as? UIImageView {
                  imageView.layer.cornerRadius = cornerRadius
                  imageView.clipsToBounds = true
               }
            }
        }
    }
    /*  Uncomment to increase the animation duration
    override func setProgress(_ progress: Float, animated: Bool) {
        UIView.animate(withDuration: 2.0) {
            super.setProgress(progress, animated: true)
        }
    }
    */

}
