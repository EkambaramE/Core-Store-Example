//
//  editViewController.swift
//  CorestoreProj
//
//  Created by Faleela on 28/04/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreStore

class editViewController: UIViewController {
    @IBOutlet var designation: UITextField!

    @IBOutlet var nameField: UITextField!
    var updatefields : Employees?
    var updateRecord : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if(updateRecord){
        self.nameField.text = self.updatefields?.name
        self.designation.text = self.updatefields?.designation
    }
    else{
            self.nameField.text = " "
            self.designation.text = " "
    
    }
    }

    @IBAction func backPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func deleteData(sender: AnyObject) {
        
        CoreStore.beginAsynchronous { (transaction) in
            transaction.delete(self.updatefields)
            transaction.commit()
        }
        self.nameField.text = " "
        self.designation.text = " "
        
    }
    
    
    @IBAction func saveData(sender: AnyObject) {
        CoreStore.beginAsynchronous { (transaction) in
            let person = transaction.create(Into(Employees))
            person.name = self.nameField.text
            person.designation = self.designation.text
            transaction.commit { (result) -> Void in
                switch result {
                case .Success(let hasChanges): print("success!")
                case .Failure(let error): print(error)
                }
            }
        }
        
      
    }
    
    
    @IBAction func updateData(sender: AnyObject) {
        
        CoreStore.beginAsynchronous { (transaction) -> Void in
            let person = transaction.fetchOne(
                From(Employees),
                Where("name", isEqualTo: self.updatefields?.name)
            )
            person?.name = self.nameField.text
            person?.designation = self.designation.text
            transaction.commit()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  }
}
