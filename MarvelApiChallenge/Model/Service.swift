//
//  Service.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
class Service {
    
    private let URLBase = "https://gateway.marvel.com:443/v1/public/"
    private let session = URLSession.shared
    
    private let publicKey: String
    private let privateKey: String
    
    let decoder = JSONDecoder()
    
    
    public init(publicKey: String, privateKey: String) {
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    
    
    
}
