//
//  Connectivity.swift
//  lodos_case
//
//  Created by sercan kaya on 10.08.2022.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
