//
//  LargeCategoryCell.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/9/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCell {
    
    private let largeAppCellId = "largeAppCellId"
    
    override func setupViews() {
        super.setupViews()
        appsCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeAppCellId, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appCategory?.apps?[indexPath.item] {
            featuredAppsController?.showAppDetail(app)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt sizeForItemAtIndexPath: IndexPath) -> CGSize {
        return CGSize(width: 220.0, height: frame.height - 40)
    }
    
    fileprivate class LargeAppCell: AppCell {
        override func setupViews() {
            
            addSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
            addConstraintsWithFormat(format: "V:|-2-[v0]-14-|", views: imageView)
        }
    }
}
