//
//  PhotosListCollectionViewCell.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation
import UIKit

class PhotosListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - components
    lazy var userImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = CGFloat(5)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var backView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    // MARK: - component Constraints
    func addBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.addConstraintsToSuperview(contentView)
    }
    func addUIImageViewConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.addConstraintsToSuperview(backView)
    }
    
    // MARK: - Lifecycle
    func configure(data: Photo) {
        if let imageURL = data.urlM {
            //self.userImage.load(urlString: imageURL)
        }
        addViews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func addViews() {
        self.contentView.addSubview(backView)
        addBackViewConstraints()
        backView.addSubview(userImage)
        addUIImageViewConstraints()
    }
}

