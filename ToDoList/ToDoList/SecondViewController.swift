//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Neo Si Hao on 30/4/19.
//  Copyright © 2019 Neo Si Hao. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var favList: [Item] = []
    
    override func viewDidAppear(_ animated: Bool) {
        favList.removeAll()
        for i in list {
            if i.fav {
                favList.append(i)
            }
        }
        favTableView.reloadData()
    }
    
    @IBOutlet weak var favTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFav", for: indexPath) as! FavListCell
        
        cell.item.text = favList[indexPath.row].name
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

