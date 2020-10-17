//
//  ProLendingViewController.swift
//  EWallet
//
//  Created on 23/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class ProLendingViewController: BaseViewController {
    static var storyBoardId: String = "ProLendingViewController"
    static var storyBoardName: String = Storyboard.onBoarding


    //MARK:-  IBOutlets

    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var socialConnectvityLabel:UILabel!
    @IBOutlet fileprivate weak var identityVerificationBtn:UIButton!
    @IBOutlet fileprivate weak var paymentMethodBtn:UIButton!
    @IBOutlet fileprivate weak var bankDetaildBtn:UIButton!
    @IBOutlet fileprivate weak var instagramBtn:UIButton!
    @IBOutlet fileprivate weak var facebookBtn:UIButton!
    @IBOutlet fileprivate weak var snapchatBtn:UIButton!
    @IBOutlet fileprivate weak var linkedInBtn:UIButton!



    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNavigationBar(title: "Pro Lending")
    }

    


    //MARK:-  Button Actions

    @IBAction fileprivate func identityVerificationBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func paymentMethodBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func bankDetaildBtnAction(_ sender:UIButton) {

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

