//
//  ResponseModel.swift
//  cleancode-lazyloading-webImage
//
//  Created by Sarath P on 31/12/22.
//

import Foundation

struct ResponseData: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
            case albumId = "albumId"
            case id = "id"
            case title = "title"
            case url = "url"
            case thumbnailUrl = "thumbnailUrl"
        }
    
}

