//
//  AppDescriptionCell.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/18/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class AppDescriptionCell: BaseCell {
    
    let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Description"
        tv.font = UIFont.systemFont(ofSize: 16)
        return tv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(descriptionTextView)
        addSubview(dividerLineView)
        
        addConstraintsWithFormat(format: "H:|-14-[v0]|", views: descriptionTextView)
        addConstraintsWithFormat(format: "H:|-14-[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:|[v0]-4-[v1(1)]|", views: descriptionTextView, dividerLineView)
    }
}
