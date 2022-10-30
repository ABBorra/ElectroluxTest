//
//  ImageSaver.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation
import UIKit


// MARK: - Image save and Download

class ImageSaver: NSObject {
    
    func downloadToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
       
    }
}
