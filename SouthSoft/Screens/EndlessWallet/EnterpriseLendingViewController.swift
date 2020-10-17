//
//  EnterpriseLendingViewController.swift
//  EWallet
//
//  Created by Appventurez on 25/08/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class EnterpriseLendingViewController: BaseViewController {
    static var storyBoardId: String = "EnterpriseLendingViewController"
    static var storyBoardName: String = Storyboard.main

    var bussinessDetailArr = ["Add legal Business Name", "Business Manager", "Add Business Description", "Mission Statement / Other", "TAX Identity", "Report Data To", "Analytics plugin", "Website URL", "Blog"]
    var keyMaticesArr = ["Company ID Verification", "Payment Method", "Re - Payment Method"]


    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        showBackButtonForcelyWhenLoad = true
        setNavigationBar(title: "Enterprise Lending")

        setupTableView()
    }

    fileprivate func setupTableView(){
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        tableView.estimatedSectionHeaderHeight = 35
        tableView.sectionHeaderHeight = UITableView.automaticDimension

        tableView.estimatedSectionFooterHeight = CGFloat.zero
        tableView.sectionFooterHeight = CGFloat.zero

        tableView.register(UINib(nibName: EnterpriseDetailsTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: EnterpriseDetailsTableViewCell.reuseId)
        tableView.register(UINib(nibName: SocialConnectionTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: SocialConnectionTableViewCell.reuseId)
    }

}

extension EnterpriseLendingViewController:UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return bussinessDetailArr.count
        }
        else if section == 1 {
            return keyMaticesArr.count+1
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: EnterpriseDetailsTableViewCell.reuseId, for: indexPath) as! EnterpriseDetailsTableViewCell
            cell.enterpriseDetailsButton.setTitle(bussinessDetailArr[indexPath.row], for:
                .normal)
            cell.enterpriseDetailsButton.backgroundColor = .white
            cell.enterpriseDetailsButton.setImage(UIImage(named: "add"), for: .normal)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            if indexPath.row < keyMaticesArr.count{
                let cell = tableView.dequeueReusableCell(withIdentifier: EnterpriseDetailsTableViewCell.reuseId, for: indexPath) as! EnterpriseDetailsTableViewCell
                cell.enterpriseDetailsButton.setTitle(keyMaticesArr[indexPath.row], for: .normal)
                if indexPath.row != 0 && indexPath.section == 1{
                    cell.enterpriseDetailsButton.backgroundColor = .white
                    cell.enterpriseDetailsButton.setImage(UIImage(named: "add"), for: .normal)
                }
                else{
                    cell.enterpriseDetailsButton.backgroundColor = AppColors.themeDarkYellow
                    cell.enterpriseDetailsButton.setImage(UIImage(named: "correct"), for: .normal)
                }
                cell.selectionStyle = .none
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: FDICInsuranceTableViewCell.reuseId, for: indexPath)
                cell.selectionStyle = .none
                return cell
            }

        }

        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: SocialConnectionTableViewCell.reuseId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableTitleHeaderView()
        if section == 0{
            headerView.label.text = "Business Details"
        }
        else if section == 1 {
            headerView.label.text = "Key Matrics"
        }
        else{
            headerView.label.text = "Social Connectivity"
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2{
           return 220
        }
        return 100
    }

}
