//
//  UIImageViewExtension.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation
import Kingfisher
import UIKit

// MARK: - Load Image using Kingfisher Lib
extension UIImageView {
    
    func loadImageWith(urlString: String) {
        if let url = URL(string: urlString) {
            self.kf.setImage(with: url)
        }
    }
}
