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
    
    var appInformation: AppInformation? {
        didSet {
            if let companyName = appInformation?.Name {
                companyLabel.text = companyName
            } else {
                companyLabel.text = "Apple"
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
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        super.layer.addSublayer(border)
    }
    
    let ageRatingLabel: EdgeInsetLabel = {
        let label = EdgeInsetLabel()
        label.text = "12+"
        label.textColor = .darkGray
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 1
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.text = "ABtech Applications >"
        label.numberOfLines = 2
        return label
    }()
    
    // If/when active - will have a rating in data and adjust star rating with collection view cells
    
    let starImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullStar")
        return image
    }()
    
    let starImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullStar")
        return image
    }()
    
    let starImage3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullStar")
        return image
    }()
    
    let starImage4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullStar")
        return image
    }()
    
    let starImage5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullStar")
        return image
    }()
    
    let reviewNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "(1,273)"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 9)
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10)
        return button
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        let starImageArray = [starImage1, starImage2, starImage3, starImage4, starImage5]
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        addSubview(ageRatingLabel)
        addSubview(companyLabel)
        
        for star in starImageArray {
            addSubview(star)
        }

        addSubview(reviewNumberLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        addConstraintsWithFormat(format: "H:|-14-[v0(100)]-10-[v1]-8-[v2]", views: imageView, nameLabel, ageRatingLabel)
        addConstraintsWithFormat(format: "V:|-14-[v0(100)]", views: imageView)
        
        addConstraintsWithFormat(format: "V:|-14-[v0(20)][v1(20)]", views: nameLabel, companyLabel)
        addConstraintsWithFormat(format: "H:|-125-[v0]", views: companyLabel)
        
        addConstraintsWithFormat(format: "V:|-18-[v0]", views: ageRatingLabel)
        
        addConstraintsWithFormat(format: "H:|-125-[v0(10)][v1(10)][v2(10)][v3(10)][v4(10)]-4-[v5]", views: starImage1, starImage2, starImage3, starImage4, starImage5, reviewNumberLabel)
        
        for star in starImageArray {
            addConstraintsWithFormat(format: "V:[v0(10)]-56-|", views: star)
        }

        addConstraintsWithFormat(format: "V:[v0]-56-|", views: reviewNumberLabel)
        
        addConstraintsWithFormat(format: "H:|-40-[v0]-40-|", views: segmentedControl)
        addConstraintsWithFormat(format: "V:[v0(34)]-10-|", views: segmentedControl)
        
        addConstraintsWithFormat(format: "H:[v0]-14-|", views: buyButton)
        addConstraintsWithFormat(format: "V:[v0]-56-|", views: buyButton)
        
        addConstraintsWithFormat(format: "H:|-14-[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: dividerLineView)
    }
}
