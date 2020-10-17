//
//  SideMenuViewController.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/23/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class SideMenuViewController: BaseViewController {
    
    static var storyBoardId: String = "SideMenuViewController"
    static var storyBoardName: String = Storyboard.main
    
    private enum SideMenuOptions:String,CaseIterable {
        case CheckingBalance = "Checking Balance"
        case OutstandingLoans = "Outstanding Loans"
        case UnleashedBalance = "Unleashed Balance"
        case LendingToolbox = "Lending Toolbox"
        case InvestorsBlog = "Investor's Blog"
        case Settings = "Settings"
        case Logout = "Logout"
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var homeNavVC:UINavigationController?{
        self.slideMenuController()?.mainViewController as? UINavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    fileprivate func setupTableView(){
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: SideMenuTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell.reuseId)
    }
    
    @IBAction func menuButtonClicked(sender: UIButton) {
        self.slideMenuController()?.closeLeft()
    }
}

extension SideMenuViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.reuseId, for: indexPath) as! SideMenuTableViewCell
        let option = SideMenuOptions.allCases[indexPath.row]
        cell.label.text = option.rawValue
        cell.setProButtonHidden(true)
        
        switch option {
        case .CheckingBalance:
            cell.icon?.image = UIImage(named: "balance_icon")
        case .OutstandingLoans:
            cell.icon?.image = UIImage(named: "ot_loans_icon")
        case .UnleashedBalance:
            cell.icon?.image = UIImage(named: "unlease_balance_icon")
            
        case .LendingToolbox:
            cell.setProButtonHidden(false)
            cell.icon?.image = UIImage(named: "lending_icon")
            
        case .InvestorsBlog:
            cell.setProButtonHidden(false)
            cell.icon?.image = UIImage(named: "investor_icon")
            
        case .Settings:
            cell.icon?.image = UIImage(named: "setting_icon")
            
        case .Logout:
            cell.icon?.image = UIImage(named: "logout_icon")
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = SideMenuOptions.allCases[indexPath.row]
        
        switch option {
            
        case .CheckingBalance:
            checkAndPushViewInNavigation(BorrowersAccountViewController.self)

        case .OutstandingLoans:
            checkAndPushViewInNavigation(OutstandingLoansViewController.self)
            
        case .UnleashedBalance:
            checkAndPushViewInNavigation(LoanPetitionViewController.self)

        case .LendingToolbox:
            checkAndPushViewInNavigation(DashBoardViewController.self)
        
        case .InvestorsBlog:
            checkAndPushViewInNavigation(HomeEndlessViewController.self)
            
        case .Logout:
            AppInitialiser.shared.setInitials()
            
        default:
                break;
        }
        
        self.slideMenuController()?.closeLeft()
    }
    
    fileprivate func checkAndPushViewInNavigation(_ vcClass: AnyClass){
      
        if let vc = homeNavVC?.viewControllers.first(where: { type(of: $0) == vcClass}){
            homeNavVC?.popToViewController(vc, animated: false)
        }
        else if let vcClass = vcClass as? BaseViewController.Type{
            let vc = vcClass.instantiateFromStoryBoard()
            homeNavVC?.pushViewController(vc, animated: true)
        }
        
        //self.slideMenuController()?.closeLeft()
    }
    
    
}
