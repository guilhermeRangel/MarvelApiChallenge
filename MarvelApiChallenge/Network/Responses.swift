//
//  Responses.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation

struct MarvelResponse<T: Codable>: Codable {
  let data: MarvelResults<T>
}

struct MarvelResults<T: Codable>: Codable {
  let results: [T]
}

//struct ImgurResponse<T: Codable>: Codable {
//  let data: T
//}
