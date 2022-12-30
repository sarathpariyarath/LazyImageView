//
//  DataManager.swift
//  cleancode-lazyloading-webImage
//
//  Created by Sarath P on 31/12/22.
//

import Foundation

struct EndPoints {
    let baseUrl = "https://jsonplaceholder.typicode.com/photos"
}

struct DataManager {
    func getData(urlString: String, completion: @escaping(_ result: [ResponseData]) -> Void) {
        HttpUtility().getAPI(urlString: EndPoints().baseUrl, requestType: [ResponseData].self) { result in
            print(result)
            _=completion(result)
        }
    }
}
