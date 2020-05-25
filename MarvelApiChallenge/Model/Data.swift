//
//  Data.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation

struct Dataa : Codable {
	var offset : String?
	var limit : String?
	var total : String?
	var count : String?
	var results : [Results]?

	enum CodingKeys: String, CodingKey {

		case offset = "offset"
		case limit = "limit"
		case total = "total"
		case count = "count"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		offset = try values.decodeIfPresent(String.self, forKey: .offset)
		limit = try values.decodeIfPresent(String.self, forKey: .limit)
		total = try values.decodeIfPresent(String.self, forKey: .total)
		count = try values.decodeIfPresent(String.self, forKey: .count)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}
