//
//  FlickerEndPoint.swift
//  NetworkingAPIExample
//
//  Created by Sagar Kadam on 10/06/22.
//

import Foundation

enum FlickerEndPoint : EndPoint {
    case getSearchResults(searchText: String, page: Int)

    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "api.flicker.com"
        }
    }
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "services/rest"
        }
    }
    
    var parameters: [URLQueryItem] {
        let apiKey = "cb5f43ef19332c5ea06e77febfdc0fd0"
        
        switch self {
        case .getSearchResults(let searchText, let page):
            return [URLQueryItem(name: "text", value: searchText),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "method", value: "flicker.photos.search"),
                    URLQueryItem(name: "format", value: "json"),
                    URLQueryItem(name: "per_page", value: "20"),
                    URLQueryItem(name: "nojsoncallback", value: "1"),
                    URLQueryItem(name: "api_key", value: apiKey)]
        }
    }
    
    var method: String {
        switch self {
        case .getSearchResults:
            return "GET"
        }
    }
}
