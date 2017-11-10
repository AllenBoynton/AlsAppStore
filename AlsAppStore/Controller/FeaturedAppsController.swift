//
//  FeaturedAppsController.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/6/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var appCategories: [AppCategory]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        appCategories = AppCategory.sampleAppCategories()
        
        AppCategory.fetchFeaturedApps { (appCategories) -> () in
            self.appCategories = appCategories
            self.collectionView?.reloadData()
        }
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.frame.width
        let height: CGFloat = 210.0
        return CGSize(width: width, height: height)
    }
}

