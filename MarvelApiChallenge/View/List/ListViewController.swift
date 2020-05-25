//
//  ViewController.swift
//  MarvelApiChallenge
//
//  Created by Guilherme Rangel on 24/05/20.
//  Copyright © 2020 Guilherme Rangel. All rights reserved.
//

import Foundation
import UIKit
import Moya


class ListViewController: UIViewController  {
    
    var listPresenter = Presenter()
    let provider = MoyaProvider<Marvel>()
    
    @IBOutlet weak var tableViewCharacters: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCharacters.rowHeight = 150
        requestCharacters()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

    }
}

extension ListViewController{
    
    func requestCharacters(){
        provider.request(.characters) {result in
            
            switch result {
            case .success(let response):
                do {
                    let characters = try response.map(MarvelResponse<Character>.self)
                    for character in characters.data.results{
                        DispatchQueue.main.async {
                             self.listPresenter.character?.character.append(character)
                                   self.tableViewCharacters.reloadData()
                               }
                       
                    }
                } catch {
                    print("catch not recorded")
                }
            case .failure(let response):
                print("Fail\(response.errorDescription ?? "Response Fail")")
            }
        }
        DispatchQueue.main.async {
            self.tableViewCharacters.reloadData()
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = listPresenter.character?.character.count {
            return count
        }else{
            return 20
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell else {
            fatalError()
        }
        if listPresenter.character?.character.count ?? 0 > 0{
             cell.configureWith((listPresenter.character?.character[indexPath.item])!)
        }
       
        
        
        return cell
    }
    
    
}

