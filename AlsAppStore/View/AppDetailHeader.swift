//
//  AppDetailHeader.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/17/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class AppDetailHeader: BaseCell {
    
    var app: App? {
        didSet {
            if let name = app?.Name {
                nameLabel.text = name
            }
            
            if let imageName = app?.ImageName {
                imageView.image = UIImage(named: imageName)
            }
            
            if let price = app?.Price {
                buyButton.setTitle("$\(price)", for: .normal)
            } else {
                buyButton.setTitle("FREE", for: .normal)
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
        sc.selectedSegmentIndex = 0
        sc.tintColor = .gray
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.darkGray
        label.text = "ABtech Applications"
        label.numberOfLines = 1
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        addConstraintsWithFormat(format: "H:|-14-[v0(100)]-8-[v1]-14-|", views: imageView, nameLabel)
        addConstraintsWithFormat(format: "V:|-14-[v0(100)]", views: imageView)
        
        addConstraintsWithFormat(format: "V:|-14-[v0(20)][v1(20)]", views: nameLabel, categoryLabel)
        addConstraintsWithFormat(format: "H:|-123-[v0]", views: categoryLabel)
        
        addConstraintsWithFormat(format: "H:|-40-[v0]-40-|", views: segmentedControl)
        addConstraintsWithFormat(format: "V:[v0(34)]-8-|", views: segmentedControl)
        
        addConstraintsWithFormat(format: "H:[v0(60)]-14-|", views: buyButton)
        addConstraintsWithFormat(format: "V:[v0(32)]-56-|", views: buyButton)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: dividerLineView)
    }
}
