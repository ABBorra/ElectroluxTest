//
//  ApiUrls.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation

struct ApiUrls {
    static var baseUrl: String {
        return "https://api.flickr.com/services/rest?"
    }
}

// MARK: - Creating query items.
extension URL {
    func appendingQueryComponent(_ queryItem: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}

