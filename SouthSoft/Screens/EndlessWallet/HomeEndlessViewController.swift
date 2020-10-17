//
//  HomeEndlessViewController.swift
//  EWallet
//
//  Created on 22/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class HomeEndlessViewController: BaseViewController {
    static var storyBoardId: String = "HomeEndlessViewController"
    static var storyBoardName: String = Storyboard.onBoarding


    //MARK:-  IBOutlets
    @IBOutlet fileprivate weak var containerView:UIView!
    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var borrowBtn:UIButton!
    @IBOutlet fileprivate weak var lendBtn:UIButton!
    @IBOutlet fileprivate weak var skipBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(showAttributedTitle:true)
    }

    //MARK:-  Button Actions
    @IBAction fileprivate func walletVideoBtnAction(_ sender:UIButton) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com")!, options: [:], completionHandler: nil)
    }

    @IBAction fileprivate func borrowBtnAction(_ sender:UIButton) {
        let vc = BorrowingViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction fileprivate func lendBtnAction(_ sender:UIButton) {
        let vc = LendingViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction fileprivate func skipBtnAction(_ sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
