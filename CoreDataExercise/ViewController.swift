//
//  ViewController.swift
//  CoreDataExercise
//
//  Created by Camilo Cabana on 10/10/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit
import CoreData

var users = [User]()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add", message: "Add an User", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
            textField.textAlignment = .right
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Age"
            textField.textAlignment = .right
        }
        let actionOne = UIAlertAction(title: "Add", style: .default) { (actionOne) in
            let name = alert.textFields?[0].text
            let age = alert.textFields?[1].text
            let user = User(context: PersistenceService.context)
            user.name = name
            user.age = Int32(age!)!
            users.append(user)
            PersistenceService.saveContext()
        }
        let actionTwo = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        present(alert, animated: true)
    }
    

    @IBAction func listButton(_ sender: Any) {
        let fetchRequestUser: NSFetchRequest<User> = User.fetchRequest()
        do {
            let user = try PersistenceService.context.fetch(fetchRequestUser)
            users = user
        } catch { print("error loaded database") }
    }
}

