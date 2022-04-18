//
//  NetworkError.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 18/04/22.
//

import Foundation
import Alamofire

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
