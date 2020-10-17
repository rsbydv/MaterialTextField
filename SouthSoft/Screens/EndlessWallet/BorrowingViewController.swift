//
//  BorrowingViewController.swift
//  EWallet
//
//  Created on 22/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class BorrowingViewController: BaseViewController {
    static var storyBoardId: String = "BorrowingViewController"
    static var storyBoardName: String = Storyboard.onBoarding


   //MARK:-  IBOutlets
    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var freeBtn:UIButton!
    @IBOutlet fileprivate weak var insiderBtn:UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(showAttributedTitle:true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    //MARK:-  Button Actions
    @IBAction fileprivate func walletVideoBtnAction(_ sender:UIButton) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com")!, options: [:], completionHandler: nil)
    }

    @IBAction fileprivate func freeBtnAction(_ sender:UIButton) {
    }

    @IBAction fileprivate func insiderBtnAction(_ sender:UIButton) {
    }

}

