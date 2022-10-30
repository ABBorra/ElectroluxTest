//
//  PhotoDetailViewModel.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation

protocol PhotoDetialViewModelProtocol {
    var imageURL: String? { get set }
    var title: String? { get set }
    var photoId: String? { get set }
    var ownerId: String? { get set }
}

struct PhotoDetailViewModel: PhotoDetialViewModelProtocol {
    var imageURL: String?
    var title: String?
    var photoId: String?
    var ownerId: String?
}
