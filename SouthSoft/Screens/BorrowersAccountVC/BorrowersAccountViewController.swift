//
//  BorrowersAccountViewController.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/23/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class BorrowersAccountViewController: BaseViewController {
    static var storyBoardId: String = "BorrowersAccountViewController"
    static var storyBoardName: String = Storyboard.main
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBackButtonForcelyWhenLoad = true
        setNavigationBar(title: "Borrower's Account",
                         leftBtnImage: UIImage(named: "hamburger_icon") ?? UIImage(),
                         rightBtnImage: UIImage(named: "profile_dot_icon"))
        
        setupTableView()
    }
    
    fileprivate func setupTableView(){
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedSectionHeaderHeight = 35
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        
        tableView.estimatedSectionFooterHeight = CGFloat.zero
        tableView.sectionFooterHeight = CGFloat.zero
        
        tableView.register(UINib(nibName: BorrowersTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: BorrowersTableViewCell.reuseId)
    }
    
    override func onBackButtonPressed(button: UIButton) {
        self.slideMenuController()?.openLeft()
    }
    override func onRightButtonPressed(button: UIButton) {
        let profileVC = UserProfileViewController.instantiateFromStoryBoard()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

extension BorrowersAccountViewController:UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BorrowersTableViewCell.reuseId, for: indexPath)
        return cell
    }
  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableTitleHeaderView()
        headerView.label.text = "Account Breakdown"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}
