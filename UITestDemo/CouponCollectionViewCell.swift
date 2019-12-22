//
//  CouponCollectionViewCell.swift
//  UITestDemo
//
//  Created by ma c on 2019/12/22.
//  Copyright © 2019 ma c. All rights reserved.
//

import UIKit

class CouponCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
        
        let imageView = UIImageView(image: UIImage(named: "CouponBackgroundImage"))
        imageView.frame = contentView.bounds
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
