//
//  Base.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
struct BaseResponse : Codable {
	var code : String?
	var status : String?
	var copyright : String?
	var attributionText : String?
	var attributionHTML : String?
	var data : Data?
	var etag : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case status = "status"
		case copyright = "copyright"
		case attributionText = "attributionText"
		case attributionHTML = "attributionHTML"
		case data = "data"
		case etag = "etag"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		attributionText = try values.decodeIfPresent(String.self, forKey: .attributionText)
		attributionHTML = try values.decodeIfPresent(String.self, forKey: .attributionHTML)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
		etag = try values.decodeIfPresent(String.self, forKey: .etag)
	}

}
