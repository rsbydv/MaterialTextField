//
//  WelcomeViewController.swift
//  EWallet
//
//  Created by on 22/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {
    static var storyBoardId: String = "WelcomeViewController"
    static var storyBoardName: String = Storyboard.onBoarding


    //MARK:-  IBOutlets
    @IBOutlet fileprivate weak var titleLabel:UILabel!
    @IBOutlet fileprivate weak var subTitleLabel:UILabel!
    @IBOutlet fileprivate weak var signInBtn:UIButton!
    @IBOutlet fileprivate weak var signUpBtn:UIButton!
    @IBOutlet fileprivate weak var facebookBtn:UIButton!
    @IBOutlet fileprivate weak var googleBtn:UIButton!
    @IBOutlet fileprivate weak var appleBtn:UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar(showAttributedTitle:true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    //MARK:-  Button Actions


    @IBAction fileprivate func signInBtnAction(_ sender:UIButton) {
        let vc = SignInViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction fileprivate func signUpBtnAction(_ sender:UIButton) {
      
    }

    @IBAction fileprivate func facebookBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func googleBtnAction(_ sender:UIButton) {

    }

    @IBAction fileprivate func appleBtnAction(_ sender:UIButton) {

    }

}

