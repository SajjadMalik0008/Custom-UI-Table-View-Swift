//
//  CustomTableViewCell.swift
//  UITableView
//
//  Created by Muhammad Sajjad on 15/09/2020.
//  Copyright © 2020 Muhammad Abuzar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cell: UITableViewCell!
    @IBOutlet var textField: UITextField!;
    @IBOutlet weak var remove:UIButton!
    @IBOutlet weak var delete:UIButton!
    @IBOutlet weak var obj:ViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    //photo;.layer.cornerRadius = image.frame.size.height/2
        @IBAction func onUpdate(_ sender: Any) {
            obj.update(delete,string: self.textField.text!)
            self.label.text = textField.text
            
           // obj.update(string: self.textField.text!)
            self.textField.text=nil
            textField.resignFirstResponder()
            
    
        }
        @IBAction func onRemove(_ sender: Any) {
            
            obj.remove(remove,string: self.textField.text!)
            
        }
    

}
