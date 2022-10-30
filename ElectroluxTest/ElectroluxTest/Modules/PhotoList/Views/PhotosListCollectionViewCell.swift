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
    
    lazy var titleLbl: UILabel = {
        return genericLbl(textfont: .systemFont(ofSize: 15))
    }()
    
    // MARK: - setup genericLbl
    func genericLbl(textfont: UIFont) -> UILabel {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.textColor = .systemTeal
        lbl.font = textfont
        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return lbl
    }
    
    // MARK: - component Constraints
    func addBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.addConstraintsToSuperview(contentView)
    }
    
    func addUIImageViewConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.anchor(top: backView.topAnchor, topConstant: 0, left: backView.leftAnchor, leftConstant: 0, right: backView.rightAnchor, rightConstant: 0, heightConstant: 50, heightPriority: 100, isHeightConstantLowPriority: true)
    }
    
    func addTitleConstraints() {
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.anchor(top: userImage.bottomAnchor, topConstant: 2, left: backView.leftAnchor, leftConstant: 0, bottom: backView.bottomAnchor, bottomConstant: 0, right: backView.rightAnchor, rightConstant: 0, heightConstant: 20,heightPriority: 800, isHeightConstantLowPriority: true)
    }
    
    // MARK: - Lifecycle
    func configure(data: Photo) {
        if let imageURL = data.urlM {
            // Display Images using KF Lib
            self.userImage.loadImageWith(urlString: imageURL)
        }
        titleLbl.text = "\(data.title ?? "")"
        addViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addViews() {
        self.contentView.addSubview(backView)
        addBackViewConstraints()
        backView.addSubview(userImage)
        backView.addSubview(titleLbl)
        addUIImageViewConstraints()
        addTitleConstraints()
    }
}

