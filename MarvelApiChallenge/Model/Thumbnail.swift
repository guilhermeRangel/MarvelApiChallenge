//
//  Thumbnail.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
struct Thumbnail : Codable {
    var path : String?
    var extensionn : String?

    enum CodingKeys: String, CodingKey {

        case path = "path"
        case extensionn = "extension"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        extensionn = try values.decodeIfPresent(String.self, forKey: .extensionn)
    }

}
