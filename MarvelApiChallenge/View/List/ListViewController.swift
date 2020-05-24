//
//  ViewController.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import UIKit

class ListViewController: UIViewController  {

    var listPresenter = Presenter()
    @IBOutlet weak var tableViewCharacters: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCharacters.rowHeight = 150
    }


}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell else {
                   fatalError()
               }
        
        cell.settupCell(thumbnail: UIImage.init(named: "ops")!, title: "Error", description: "Error de person")
            return cell
    }

    
}

