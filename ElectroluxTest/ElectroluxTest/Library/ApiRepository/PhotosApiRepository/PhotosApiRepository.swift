//
//  PhotosApiRepository.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation
import Toaster

protocol PhotosApiProtocol {
    func getPhotosItems(pageSize: Int, page: Int, apiKey: String,searchImage: String,serviceName: String,optionalParams: String ,onComplete: @escaping(PhotoListModel?,Error?) -> Void)
}

class PhotosApi: PhotosApiProtocol {
    
    // MARK: - Photos request from Api
    func getPhotosItems(pageSize: Int, page: Int, apiKey: String,searchImage: String ,serviceName: String,optionalParams: String,onComplete: @escaping(PhotoListModel?,Error?) -> Void) {
        
        guard NetworkManager.isReachable() else {
            let toast = Toast(text: "No internet Connection")
            ToastView.appearance().backgroundColor = .red
            toast.show()
            return
        }
        
        let url = "\(ApiUrls.baseUrl)api_key=\(apiKey)&method=\(serviceName)&per_page=\(pageSize)&page=\(page)&tags=\(searchImage)\(optionalParams)"
        
        Request.get(str: url, type: PhotoListModel.self) { response, error in
            onComplete(response, error)
        }
    }
}
