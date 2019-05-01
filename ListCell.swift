//
//  ListCell.swift
//  ToDoList
//
//  Created by Neo Si Hao on 30/4/19.
//  Copyright © 2019 Neo Si Hao. All rights reserved.
//

import UIKit

protocol ChangeButtonImage {
    func changeButtonImage(fav: Bool, index: Int)
}

class ListCell: UITableViewCell {

    @IBAction func favButtonAction(_ sender: Any) {
        if list[indexP!].fav {
            delegate?.changeButtonImage(fav: false, index: indexP!)
        } else {
            delegate?.changeButtonImage(fav: true, index: indexP!)
        }
    }
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var item: UILabel!
    
    var delegate: ChangeButtonImage?
    var indexP: Int?
    var list: [Item] = []
    
}
