//
//  ScreenshotsCell.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/17/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class ScreenshotsCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var app: App? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        addSubview(dividerLineView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        
        addConstraintsWithFormat(format: "H:|-14-[v0]|", views: dividerLineView)
        
        addConstraintsWithFormat(format: "V:|[v0][v1(1)]|", views: collectionView, dividerLineView)
        
        collectionView.register(ScreenshotsImageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = app?.Screenshots?.count {
            return count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotsImageCell
        
        if let imageName = app?.Screenshots?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)
        } else {
            cell.imageView.image = UIImage(named: "download")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: frame.height - 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    private class ScreenshotsImageCell: BaseCell {
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.layer.shadowColor = UIColor.black.cgColor
            iv.layer.shadowOffset = CGSize(width: 2, height: 2)
            iv.layer.shadowOpacity = 1
            return iv
        }()
        
        override func setupViews() {
            super.setupViews()
            
            layer.masksToBounds = true
            
            addSubview(imageView)
            
            addConstraintsWithFormat(format: "H:|[v0]-8-|", views: imageView)
            addConstraintsWithFormat(format: "V:|[v0]|", views: imageView)
        }
    }
}
