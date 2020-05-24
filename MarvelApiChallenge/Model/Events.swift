//
//  Events.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
struct Events : Codable {
	var available : String?
	var returned : String?
	var collectionURI : String?
	var items : [Items]?

	enum CodingKeys: String, CodingKey {

		case available = "available"
		case returned = "returned"
		case collectionURI = "collectionURI"
		case items = "items"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		available = try values.decodeIfPresent(String.self, forKey: .available)
		returned = try values.decodeIfPresent(String.self, forKey: .returned)
		collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
		items = try values.decodeIfPresent([Items].self, forKey: .items)
	}

}
