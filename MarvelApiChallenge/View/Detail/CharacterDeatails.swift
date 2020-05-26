//
//  Details.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class CharacterDeatails: UIViewController{
    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var imgDetail:URL? = URL(string: "")
    var titleLbl: String? = ""
    var descriptionLbl: String? = ""
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        imgDetails.kf.setImage(with: imgDetail)
        lblTitle.text = titleLbl
        lblDescription.text = descriptionLbl
        self.reloadInputViews()
        
        
    }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(true)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.isTranslucent = false
        }
    

    
}
