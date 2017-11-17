//
//  FeaturedAppsController.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/6/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let largeCellId = "largeCellId"
private let headerId = "headerId"
private let descriptionCellId = "descriptionCellId"

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var featuredApps: FeaturedApps?
    var appCategories: [AppCategory]?
    var customAppCategories: [CustomAppCategory]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Featured Apps"
        
//        customAppCategories = CustomAppCategory.sampleAppCategories()
        
        AppCategory.fetchFeaturedApps { (featuredApps) -> () in
            self.featuredApps = featuredApps
            self.appCategories = featuredApps.categories
            self.collectionView?.reloadData()
        }
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        
        collectionView?.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func showAppDetail(_ app: App) {
        let layout = UICollectionViewFlowLayout()
        let appDetailController = AppDetailController(collectionViewLayout: layout)
        appDetailController.app = app
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CategoryCell
        
        if indexPath.item == 2 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
            cell.featuredAppsController = self
            
            return cell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell            
        }
        
        cell.appCategory = appCategories?[indexPath.item]
        cell.customAppCategory = customAppCategories?[indexPath.item]
        cell.featuredAppsController = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        
        if let count = customAppCategories?.count {
            return count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        }
        
        let width: CGFloat = view.frame.width
        let height: CGFloat = 200.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 130)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        
        header.appCategory = featuredApps?.bannerCategory
        
        return header
    }
}

