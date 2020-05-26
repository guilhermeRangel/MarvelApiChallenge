//
//  Colors.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 25/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
import UIKit

enum Colors {
    
    static var redMarvel: UIColor {
        let hexColor = "E93323"
        guard let color =  UIColor(named: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    
    static var green: UIColor {
        return UIColor.init(red: 0.125, green: 0.608, blue: 0.525, alpha: 1)
    }
    
    
}
