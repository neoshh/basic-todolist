//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Neo Si Hao on 30/4/19.
//  Copyright © 2019 Neo Si Hao. All rights reserved.
//

import UIKit

class Item {
    var name: String = ""
    var fav: Bool = false
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

var list: [Item] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddItem, ChangeButtonImage {
    
    @IBAction func sortAction(_ sender: Any) {
        list = list.sorted{$0.name < $1.name}
        tableView.reloadData()
    }
    
    
    func changeButtonImage(fav: Bool, index: Int) {
        list[index].fav = fav
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! AddItemController
        viewController.delegate = self
    }
    
    func addItem(name: String) {
        list.append(Item(name: name))
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
        
        cell.item.text = list[indexPath.row].name
        
        if list[indexPath.row].fav {
            cell.favButton.setBackgroundImage(#imageLiteral(resourceName: "Fav"), for: UIControl.State.normal)
        } else {
            cell.favButton.setBackgroundImage(#imageLiteral(resourceName: "notFav"), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.list = list
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

