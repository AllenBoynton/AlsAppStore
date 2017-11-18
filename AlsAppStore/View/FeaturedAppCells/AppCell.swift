//
//  AppCell.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/9/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class AppCell: BaseCell {
    
    var app: App? {
        didSet {
            
            if let name = app?.Name {
                nameLabel.text = name
                
                let rectSize = NSString(string: name).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)], context: nil)
                
                if rectSize.height > 20 {
                    nameLabel.frame = CGRect(x: 0, y: frame.width, width: frame.width, height: 40)
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 32, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 47, width: frame.width, height: 20)
                } else {
                    nameLabel.frame = CGRect(x: 0, y: frame.width - 8, width: frame.width, height: 40)
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 17, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 33, width: frame.width, height: 20)
                }
            }
            
            if let imageName = app?.ImageName {
                imageView.image = UIImage(named: imageName)
            }
            
            if let category = app?.Category {
                categoryLabel.text = category
            }
            
            if let price = app?.Price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
        }
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 1
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
    }
}

