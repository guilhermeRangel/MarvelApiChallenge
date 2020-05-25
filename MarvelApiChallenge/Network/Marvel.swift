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


public enum Marvel {
    case characters
    
    static private let privateKey = "32733661327f02e4bb659de42654f31d67697336"
    static private let publicKey = "297ec36cf23d74577eed62b2f0167bcf"
    
    
}

extension Marvel: TargetType {
    
    public var sampleData: Data {
        return Data()
    }
    
    
    public var baseURL: URL {
        return URL(string: "https://gateway.marvel.com:443/v1/public")!
    }
    
    public var path: String {
        switch self {
        case .characters:
            return "/characters"
            
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .characters:
            return .get
        }
    }
    
    
    
    public var task: Task {
        
        let ts = "\(Date().timeIntervalSince1970)"
        let hash = MD5(string: (ts + Marvel.privateKey + Marvel.publicKey))
        let authParams = ["ts": ts, "apikey": Marvel.publicKey, "hash": hash]
        
        switch self {
        case .characters:
            return .requestParameters(parameters: ["orderBy": "name",
                                                   "limit": 20] +
                authParams, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}


//MARK: - CryptoKit
extension Marvel {
    func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
