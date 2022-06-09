//
//  FlickerModels.swift
//  NetworkingAPIExample
//
//  Created by Sagar Kadam on 10/06/22.
//

import Foundation

struct FlickerResponse: Codable {
    let photos: FlickerResultPage?
}

struct FlickerResultPage: Codable {
    let page: Int
    let pages: Int
    let photo: [FlickerPhoto]
}

struct FlickerPhoto: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
}


