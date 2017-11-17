//
//  AppDetailController.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/10/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let headerId = "headerId"
    
    var app: App? {
        didSet {
            navigationItem.title = app?.Name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .white
        
        collectionView?.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        header.app = app
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
}

class AppDetailHeader: BaseCell {
    
    var app: App? {
        didSet {
            if let name = app?.Name {
                nameLabel.text = name
            }
            
            if let imageName = app?.ImageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details", "Reviews", "Related"])
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-14-[v0(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
