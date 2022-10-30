//
//  ViewExtension.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addConstraintsToSuperview(_ view: UIView,
                                   topConstraint: CGFloat = 0.0,
                                   bottomConstraint: CGFloat = 0.0,
                                   leadingConstraint: CGFloat = 0.0,
                                   trailingConstraint: CGFloat = 0.0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint),
            topAnchor.constraint(equalTo: view.topAnchor, constant: topConstraint),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstraint)
        ].forEach { $0.isActive = true }
        
    }
   
    func addConstraintsForVerticalTopToSuperview(_ view: UIView,
                                              leadingConstraint: CGFloat = 0.0,
                                              trailingConstraint: CGFloat = 0.0,
                                              heightConstraint: CGFloat = 0.0,
                                              topConstraint: CGFloat = 0.0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        [
            topAnchor.constraint(equalTo: view.topAnchor, constant: topConstraint),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstraint),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstraint),
            heightAnchor.constraint(equalToConstant: heightConstraint)
        ].forEach { $0.isActive = true }
    }
    
    @discardableResult func anchor(top: NSLayoutYAxisAnchor? = nil,
                                   topConstant: CGFloat = 0,
                                   left: NSLayoutXAxisAnchor? = nil,
                                   leftConstant: CGFloat = 0,
                                   bottom: NSLayoutYAxisAnchor? = nil,
                                   bottomConstant: CGFloat = 0,
                                   right: NSLayoutXAxisAnchor? = nil,
                                   rightConstant: CGFloat = 0,
                                   widthConstant: CGFloat? = nil,
                                   heightConstant: CGFloat? = nil,
                                   isHeightConstantLowPriority: Bool? = nil) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        if let top = top {
            constraints.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        if let left = left {
            constraints.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        if let bottom = bottom {
            constraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        if let right = right {
            constraints.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        if let widthConstant = widthConstant {
            constraints.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        if let heightConstant = heightConstant {
            if let _ = isHeightConstantLowPriority {
                constraints.append(heightAnchor.constraint(equalToConstant: heightConstant).withPriority(100))
            } else {
                constraints.append(heightAnchor.constraint(equalToConstant: heightConstant))
            }
            
        }
        constraints.forEach({ $0.isActive = true })
        return constraints
    }
}

extension NSLayoutConstraint
{
    func withPriority(_ priority: Float) -> NSLayoutConstraint
    {
        self.priority = UILayoutPriority(priority)
        return self
    }
}
