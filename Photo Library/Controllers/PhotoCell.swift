//
//  PhotoCell.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 06.06.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    
    
    static let reuseIdentifier = "PhotoCell"
    
    let photoImageView = UIImageView()
    
    // Анатолог awakeFromNib, Аналог viewDidLoad
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    func setupConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    

    
    
}
