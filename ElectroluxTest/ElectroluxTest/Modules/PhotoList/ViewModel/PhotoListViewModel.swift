//
//  PhotoListViewModel.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation

class PhotoListViewModel {
    
    // MARK: - Propeties
    var photoGallery = Observer(value: [Photo]())
    
    var pageSize = 21
    
    var currentPage = 1
    
    var searchImage: String?
    
    var newPhotosCount: Int {
        return photoGallery.value?.count ?? 0
    }
}
