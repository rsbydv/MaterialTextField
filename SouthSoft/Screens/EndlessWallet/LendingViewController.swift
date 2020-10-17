//
//  LendingViewController.swift
//  EWallet
//
//  Created  on 22/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class LendingViewController: BaseViewController {
    static var storyBoardId: String = "LendingViewController"
    static var storyBoardName: String = Storyboard.onBoarding
    

   //MARK:-  IBOutlets
    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var walletVideoBtn:UIButton!
    @IBOutlet fileprivate weak var standardBtn:UIButton!
    @IBOutlet fileprivate weak var proBtn:UIButton!
    @IBOutlet fileprivate weak var enterpriseBtn:UIButton!

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

    @IBAction fileprivate func standardBtnAction(_ sender:UIButton) {
        let vc = StandardLendingViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction fileprivate func proBtnAction(_ sender:UIButton) {
        let vc = ProLendingViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction fileprivate func enterpriseBtnAction(_ sender:UIButton) {

        let vc = EnterpriseLendingViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)
    }

}
