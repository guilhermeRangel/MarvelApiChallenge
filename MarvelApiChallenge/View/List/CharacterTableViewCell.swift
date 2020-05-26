//
//  CharacterTableViewCell.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class CharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgCharacter.layer.cornerRadius = 15
        lblDescription.layer.cornerRadius = 15
        
    }
    
    public func configureWith(_ character: Character) {
        title.text = character.name
        lblDescription.text = character.description ?? "No description available"
        if let imageUrlString = URL(string: character.imageURL) {
            imgCharacter.kf.setImage(with: imageUrlString)
            
        } 
        
    }
}
