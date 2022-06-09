//
//  NetworkEngine.swift
//  NetworkingAPIExample
//
//  Created by Sagar Kadam on 10/06/22.
//

import Foundation

class NetworkEngine {
    
    // 1
    class func request<T:Codable>(endPoint: EndPoint, completion: @escaping(Result<T,Error>)->()) {
        
        // 2
        var components = URLComponents()
        components.scheme = endPoint.scheme
        components.host = endPoint.baseURL
        components.path = endPoint.path
        components.queryItems = endPoint.parameters
        
        // 3
        guard let url = components.url else {return}
        
        // 4
        var urlRequest =  URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method
        
        // 5
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            // 6
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown Error")
                return
            }
            
            guard response != nil, let data = data else {return}
            
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    // 7
                    completion(.success(responseObject))
                }else {
                    let error =  NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey:"Failure to decode response"])
                    completion(.failure(error))
                }
            }
        }
        // 8
        dataTask.resume()
        
    }
}
