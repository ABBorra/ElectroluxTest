//
//  PhotosApiRepository.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation

protocol PhotosApiProtocol {
    func getPhotosItems(pageSize: Int, page: Int, apiKey: String,searchImage: String,serviceName: String, onComplete: @escaping(PhotoListModel?,Error?) -> Void)
}

class PhotosApi: PhotosApiProtocol {
    
    // MARK: - Photos request from Api
    func getPhotosItems(pageSize: Int, page: Int, apiKey: String,searchImage: String ,serviceName: String, onComplete: @escaping(PhotoListModel?,Error?) -> Void) {
               let url = "\(ApiUrls.photosApiUrl)?api_key=\(apiKey)&method=\(serviceName)&per_page=\(pageSize)&page=\(page)&tags=\(searchImage)&format=\("json")&nojsoncallback=\(true)&extras=\("media")&extras=\("url_sq")&extras=url_m"
        
        Request.get(str: url, type: PhotoListModel.self) { response, error in
            onComplete(response, error)
        }
    }
}
