//
//  Dictionary+Ext.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 25/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//


import Foundation
//MARK: - Concat [String : String]
public func + <KeyType, ValueType> (left: [KeyType: ValueType], right: [KeyType: ValueType]) -> [KeyType: ValueType] {
  var out = left

  for (k, v) in right {
    out.updateValue(v, forKey: k)
  }

  return out
}
