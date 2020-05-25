//
//  Marvel.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
import Moya
import CryptoKit
import UIKit

public enum Marvel {
    static private let privateKey = "297ec36cf23d74577eed62b2f0167bcf"
    static private let publicKey = "32733661327f02e4bb659de42654f31d67697336"
    
    case comics
    case characters
    
    
    func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}

extension Marvel: TargetType {
    
    
    public var sampleData: Data {
        return Data()
    }
    
    
    
    public var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public")!
    }
    
    public var path: String {
        switch self {
        case .comics: return "/comics"
        case .characters: return "/characters"
            
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .comics:
            return .get
        case .characters:
            return .get
        }
    }
    
    
    
    public var task: Task {
        let ts = "\(Date().timeIntervalSince1970)"
        let hash = MD5(string: (ts + Marvel.privateKey + Marvel.publicKey))
        
        let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash]
        
        switch self {
        case .comics:
            return .requestParameters(parameters: ["format": "comic",
                                                   "formatType": "comic",
                                                   "orderBy": "-onsaleDate",
                                                   "dateDescriptor": "lastWeek",
                                                   "limit": 50,
                                                   "authParams":authParams],
                                      encoding: URLEncoding.default)
        //TODO fix
        case .characters:
            return .requestData(Data())
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
extension Date {
    init?(ISO8601: String) {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: ISO8601) else { return nil }
        self = date
    }
}

