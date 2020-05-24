//
//  CharacterTableViewCell.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
import UIKit

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
     super.awakeFromNib()
     
 }
    
    
    func settupCell(thumbnail: UIImage, title: String, description: String){
        imgCharacter.image = thumbnail
        self.title.text = title
        lblDescription.text = description
        
    }
}
