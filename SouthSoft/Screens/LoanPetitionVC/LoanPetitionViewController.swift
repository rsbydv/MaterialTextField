//
//  LoanPetitionViewController.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/24/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class LoanPetitionViewController: BaseViewController {
    
    static var storyBoardId: String = "LoanPetitionViewController"
    static var storyBoardName: String = Storyboard.main
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBackButtonForcelyWhenLoad = true
        setNavigationBar(title: "Loan petition")
        
        setupTableView()
    }
    
    fileprivate func setupTableView(){
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: LoanPetitionTableCell.reuseId, bundle: nil), forCellReuseIdentifier: LoanPetitionTableCell.reuseId)
    }
    
   
}

extension LoanPetitionViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LoanPetitionTableCell.reuseId, for: indexPath)
        return cell
    }
   
    
}

