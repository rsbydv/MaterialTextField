//
//  AchievementsViewController.swift
//  EWallet
//
//  Created by Rishabh Yadav on 8/22/20.
//  Copyright © 2020 SouthSoft. All rights reserved.
//

import UIKit

class AchievementsViewController: BaseViewController {
    static var storyBoardId: String = "AchievementsViewController"
    static var storyBoardName: String = Storyboard.main
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let totalCellsInRow:CGFloat = 3
    fileprivate let cellSpacingValue:CGFloat = 10.0
    fileprivate let containerWidth = SCREEN_WIDTH
    fileprivate let headerHeight = SCREEN_WIDTH*(0.6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBackButtonForcelyWhenLoad = true
        setNavigationBar(title: "Achievements", rightBtnImage: UIImage(named: "cross_icon"))
        
        collectionViewSetup()
    }

    //MARK: - Setup Methods
    private func collectionViewSetup() {
        collectionView.register(UINib(nibName:AchievementsHeaderView.reuseId, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AchievementsHeaderView.reuseId)
        
        collectionView.register(UINib(nibName:AchievementsCollectionCell.reuseId, bundle: nil), forCellWithReuseIdentifier: AchievementsCollectionCell.reuseId)
        collectionView.contentOffset = .zero
        setLayoutOfCollectionView()
    }
    
    private func setLayoutOfCollectionView() {
        let layout: UICollectionViewFlowLayout
        if let stretchyLayout = collectionView.collectionViewLayout as? StretchyCollectionHeaderLayout{
            layout = stretchyLayout
        }else{
            layout = UICollectionViewFlowLayout()
        }
        
        
        layout.sectionInset = UIEdgeInsets(top: cellSpacingValue, left: cellSpacingValue, bottom: cellSpacingValue, right: cellSpacingValue)
        layout.minimumInteritemSpacing = cellSpacingValue
        layout.minimumLineSpacing = cellSpacingValue
        
        let availableWidth = containerWidth - (totalCellsInRow+1)*cellSpacingValue
        let widthOfCell = availableWidth/totalCellsInRow - 1.0
        let heightOfCell = widthOfCell
        
        layout.itemSize = CGSize.init(width:widthOfCell , height: heightOfCell)
        collectionView!.collectionViewLayout = layout
    }
    
}

extension AchievementsViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AchievementsHeaderView.reuseId, for: indexPath) as? AchievementsHeaderView else
            { return  UICollectionReusableView() }
            return header
        }
        return  UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementsCollectionCell.reuseId, for: indexPath) as! AchievementsCollectionCell
        
        switch indexPath.row {
        case 0:
            cell.background.isSelected = true
            cell.imageView.image = UIImage(named: "trophy")
        case 1:
            cell.background.isSelected = true
            cell.imageView.image = UIImage(named: "quality")
        case 2:
            cell.background.isSelected = true
            cell.imageView.image = UIImage(named: "birthday-and-party")
        default:
            cell.background.isSelected = false
            cell.imageView.image = UIImage(named: "lock_icon")
        }
        
        return cell
    }
    
}


extension AchievementsViewController : UICollectionViewDelegateFlowLayout{
    // header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: containerWidth, height: headerHeight)
    }
    
}
