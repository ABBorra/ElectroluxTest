//
//  PhotoListViewModel.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation
import Toaster

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
            searchImage = Secrets.defaultSearchTag
        }
        
        apiService.getPhotosItems(pageSize: self.pageSize, page: self.currentPage, apiKey: Secrets.photoApiKey, searchImage: searchImage?.trimmingCharacters(in: NSCharacterSet.whitespaces) ?? Secrets.defaultSearchTag, serviceName: Secrets.serviceName) { obj,error  in
            if let errorMessage = error {
                DispatchQueue.main.async {
                let toast = Toast(text: errorMessage.localizedDescription, delay: Delay.short, duration: Delay.long)
                    ToastView.appearance().backgroundColor = .red
                toast.show()
                }
                return
            } else {
                if let dataResponse = obj?.photos,
                   let photos = dataResponse.photo, photos.count > 0 {
                    self.photoGallery.value!  += photos
                    self.currentPage += 1
                    onComplete()
                } else {
                    // Handle Empty or failure data
                    DispatchQueue.main.async {
                        let toast = Toast(text: obj?.message ?? "No search result found")
                        ToastView.appearance().backgroundColor = .red
                        toast.show()
                    }
                   
                }
            }
            
        }
    }
    
}
