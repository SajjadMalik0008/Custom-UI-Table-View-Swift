//
//  ViewController.swift
//  UITableView
//
//  Created by Muhammad Sajjad on 14/09/2020.
//  Copyright © 2020 Muhammad Abuzar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet  var tableView : UITableView!
    @IBOutlet var label: [UILabel]!
    
    let devCousesImages = [UIImage(named: "hamburger-logo")]
    var devCourses = [("Window"),("Apple")]
    //[("Laravel"),("Swift")]
    override func viewDidLoad() {
         super.viewDidLoad()
            
         /*for i in 0...10 {
              data.append("\(i)")
         }*/
            
        tableView.dataSource = self
        tableView.delegate = self
    }
        
    private var data: [String] = []
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return devCourses.count
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    // create a cell for each table view row
   
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
    cell.obj = self

    //weak var obj1:UITableViewCell!
    cell.label.text=self.devCourses[indexPath .row]
    //let courseTitle = cell.textField.text;
    //cell.label.text=courseTitle
    cell.textField.placeholder = "Write some thing on the bord"
    //self.update()
         return cell
    }
    
       
       @IBAction func remove(_ sender: UIButton,string:String) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a table view cell")
            return
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            print("failed to get index path for cell containing button")
            return
        }
        // We've got the index path for the cell that contains the button, now do something with it.
        //print("button is in row \(indexPath.row)")
         devCourses.remove(at: indexPath.row)
       tableView.deleteRows(at: [indexPath], with: .fade)
        self.tableView.reloadData()
    }

    
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//         let alertController = UIAlertController(title: "Hint", message: "You have selected row \(indexPath.row).", preferredStyle: .alert)
//
//         let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
//
//         alertController.addAction(alertAction)
//
//         present(alertController, animated: true, completion: nil)
//
//    }
    
    
    
    @IBAction func update(_ sender: UIButton,string:String) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a table view cell")
            return
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            print("failed to get index path for cell containing button")
            return
        }
        // We've got the index path for the cell that contains the button, now do something with it.
        devCourses[indexPath.row]=string
        print("button is in row \(indexPath.row)+ \(string) + \(devCourses[indexPath.row])")
        
                //tableView.deleteRows(at: [indexPath], with: .fade)
    }
    @IBAction func addCell(_ sender: Any) {
        devCourses.append("New cell")
       // print(devCourses)
        self.tableView.reloadData()
        
    }
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let moveObj=devCourses[sourceIndexPath.item]
//        devCourses.remove(at: sourceIndexPath.item)
//        devCourses.insert(moveObj, at: destinationIndexPath.item)
//
//    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            devCourses.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Done" : "Edit"
        
    }
    
    // method to run when table view cell is tapped
   //UITableViewCell* cell = (UITableViewCell*)[sender superview]; NSIndexPath* indexPath = [myTableView indexPathForCell:cell]; 
 

}

