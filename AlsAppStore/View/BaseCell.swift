//
//  BaseCell.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/17/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

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
