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
import Kingfisher

protocol ListViewControllerDelegate: class {
    func offSet(count: Int)
}

class ListViewController: UIViewController  {
    weak var delegate: ListViewControllerDelegate?
    var listPresenter = Presenter()
    let provider = MoyaProvider<Marvel>()
    var indexPath = -1
    var fetch = false
    
    @IBOutlet weak var tableViewCharacters: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestCharacters()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
}

extension ListViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CharacterDeatails{
            
            guard let obj = listPresenter.character?.character[indexPath] else {return}
            if let imageUrlString = URL(string: obj.imageURL) {
                destination.imgDetail = imageUrlString
                destination.titleLbl = listPresenter.character?.character[indexPath].name
                destination.descriptionLbl = listPresenter.character?.character[indexPath].description
            }
        }
    }
    
    func requestCharacters(){
        provider.request(.characters) {result in
            
            switch result {
            case .success(let response):
                do {
                    let characters = try response.map(MarvelResponse<Character>.self)
                    for character in characters.data.results{
                        DispatchQueue.main.async {
                            if !character.description!.isEmpty {
                                self.listPresenter.character?.character.append(character)
                                self.tableViewCharacters.reloadData()
                            }
                        }
                    }
                } catch {
                    print("catch not recorded")
                }
            case .failure(let response):
                print("Fail\(response.errorDescription ?? "Response Fail")")
            }
        }
        fetch = false
    }
}


extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = listPresenter.character?.character.count {
            return count
        }else{
            return 10
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPath = indexPath.row
        if self.indexPath >= 0 {
            performSegue(withIdentifier: "ToDetails", sender: self)
        }
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let countObj = listPresenter.character?.character.count {
            self.delegate?.offSet(count: countObj)
            if indexPath.row+1 == countObj && !fetch {
                fetch = true
                requestCharacters()
            }
        }
        
    }
    
    
    
}

