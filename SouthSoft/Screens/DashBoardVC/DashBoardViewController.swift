//
//  DashBoardViewController.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/24/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class DashBoardViewController: BaseViewController {
    static var storyBoardId: String = "DashBoardViewController"
    static var storyBoardName: String = Storyboard.main
    
    @IBOutlet weak var chartView: CustomPieChartView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBackButtonForcelyWhenLoad = true
        setNavigationBar(title: "Welcome John!",
                         leftBtnImage: UIImage(named: "hamburger_icon") ?? UIImage(),
                         rightBtnImage: UIImage(named: "profile_dot_icon"))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chartView.setData(CustomPieChartView.ChartData(checkingBalance: 58, outstandingLoans: 33, unleaseBalance: 9))

    }
    
    override func onBackButtonPressed(button: UIButton) {
        self.slideMenuController()?.openLeft()
    }
    override func onRightButtonPressed(button: UIButton) {
        let profileVC = UserProfileViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
