//
//  HttpUtility.swift
//  cleancode-lazyloading-webImage
//
//  Created by Sarath P on 31/12/22.
//

import Foundation
import UIKit

struct HttpUtility {
    
    private let session = URLSession.shared
    
    func getAPI<T: Decodable>(urlString: String, requestType: T.Type, completion: @escaping(_ result: T) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        
        session.dataTask(with: url) { response, httpUrlResponse, error in
            if (error == nil) {
                if let response = response {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: response)
                        completion(result)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }.resume()
    }
    
}
