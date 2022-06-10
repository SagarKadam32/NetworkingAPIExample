//
//  FlickerEndPoint.swift
//  NetworkingAPIExample
//
//  Created by Sagar Kadam on 10/06/22.
//

import Foundation

enum FlickerEndPoint : EndPoint {
    
    case getSearchResults(searchText: String, page: Int)
    case getBrands

    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "api.flickr.com"
        }
    }
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "/services/rest"
        case .getBrands:
            return  "/services/rest"
            
        }
    }
    
    var parameters: [URLQueryItem] {
        let apiKey = "cb5f43ef19332c5ea06e77febfdc0fd0"
        
        switch self {
        case .getSearchResults(let searchText, let page):
            return [URLQueryItem(name: "text", value: searchText),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "method", value: "flickr.photos.search"),
                    URLQueryItem(name: "format", value: "json"),
                    URLQueryItem(name: "per_page", value: "20"),
                    URLQueryItem(name: "nojsoncallback", value: "1"),
                    URLQueryItem(name: "api_key", value: apiKey)]
        case .getBrands:
            return [URLQueryItem(name: "api_key", value: apiKey),
                    URLQueryItem(name: "method", value: "flickr.cameras.getBrands")]
        }
    }
    
    var method: String {
        switch self {
        case .getSearchResults:
            return "GET"
        case .getBrands:
            return "GET"
        }
    }
}
