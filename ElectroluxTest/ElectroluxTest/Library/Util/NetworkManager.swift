//
//  NetworkManager.swift
//  ElectroluxTest
//
//  Created by AB_Borra.
//

import Foundation
import Alamofire

// MARK: - Internet Connectivity
class NetworkManager {
    class func isReachable() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
