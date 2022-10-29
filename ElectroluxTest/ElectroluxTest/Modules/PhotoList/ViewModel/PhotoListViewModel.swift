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
    
    // MARK: - Dependency
    let apiService: PhotosApiProtocol
    
    // MARK: - Lifecycle
    init(apiService: PhotosApiProtocol = PhotosApi()) {
        self.apiService = apiService
    }
    
    // MARK: - resetPage
    func resetPage(onComplete: @escaping() -> (Void)) {
        currentPage = 1
        self.photoGallery.value = []
        fetchData() {
            onComplete()
        }
    }
    // MARK: - Api Calls
    
    func fetchData(onComplete: @escaping() -> (Void)) {
        if (searchImage ?? "").isEmpty {
            searchImage = "Electrolux"
        }
        
        apiService.getPhotosItems(pageSize: self.pageSize, page: self.currentPage, apiKey: Secrets.photoApiKey, searchImage: searchImage?.trimmingCharacters(in: NSCharacterSet.whitespaces) ?? "Electrolux", serviceName: Secrets.serviceName) { obj in
            if let dataResponse = obj?.photos,
               let photos = dataResponse.photo {
                self.photoGallery.value!  += photos
                self.currentPage += 1
                onComplete()
            }
        }
    }
    
}
