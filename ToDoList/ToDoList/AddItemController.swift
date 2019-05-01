//
//  AddItemController.swift
//  ToDoList
//
//  Created by Neo Si Hao on 30/4/19.
//  Copyright © 2019 Neo Si Hao. All rights reserved.
//

import UIKit

protocol AddItem {
    func addItem(name: String)
}

class AddItemController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func addAction(_ sender: Any) {
        if !input.text!.isEmpty {
            delegate?.addItem(name: input.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    var delegate: AddItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
