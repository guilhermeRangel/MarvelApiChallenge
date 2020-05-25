//
//  Character.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 25/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var description: String?
    var imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
    }
    
    enum ThumbnailCodingKeys: String, CodingKey {
        case path
        case extensionImage = "extension"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        
        var thumbnailContainer = container.nestedContainer(keyedBy: ThumbnailCodingKeys.self, forKey: .thumbnail)
        try thumbnailContainer.encode(imageURL, forKey: .path)
        try thumbnailContainer.encode("", forKey: .extensionImage)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try? container.decode(String.self, forKey: .description)
        
        let thumbnailContainer = try container.nestedContainer(keyedBy: ThumbnailCodingKeys.self, forKey: .thumbnail)
        let path = try thumbnailContainer.decode(String.self, forKey: .path)
        let extensionImage = try thumbnailContainer.decode(String.self, forKey: .extensionImage)
        
        if (extensionImage != "") {
            imageURL = "\(path)/portrait_medium.\(extensionImage)"
        } else {
            imageURL = path
        }
    }
    
}
