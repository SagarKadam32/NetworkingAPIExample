//
//  ContentView.swift
//  NetworkingAPIExample
//
//  Created by Sagar Kadam on 08/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        Button("Hit Me") {
            DispatchQueue.main.async {
                NetworkEngine.request(endPoint: FlickerEndPoint.getSearchResults(searchText: "iOS", page: 1)) { (result: Result<FlickerResponse, Error>) in
                    
                    switch result {
                    case .success(let response):
                        print("Response: ", response)
                    case .failure(let error):
                        print("Error: ",error)
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
