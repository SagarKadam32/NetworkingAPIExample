//
//  EndPoints.swift
//  NetworkingAPIExample
//
//  Created by Sagar Kadam on 10/06/22.
//

import Foundation

protocol EndPoint {
    var scheme: String {get}
    var baseURL: String {get}
    var path: String {get}
    var parameters: [URLQueryItem] {get}
    var method: String {get}
}
