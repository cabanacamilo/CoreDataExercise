//
//  ViewCustosController.swift
//  CoreDataExercise
//
//  Created by Camilo Cabana on 10/10/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class ViewCustosController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.text = users[row[1]].name
        ageText.text = String(users[row[1]].age)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        PersistenceService.context.delete(users[row[1]])
        users.remove(at: row[1])
        PersistenceService.saveContext()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func updateButton(_ sender: Any) {
        users[row[1]].name = nameText.text
        let age = Int32(ageText.text!)
        users[row[1]].age = age!
        PersistenceService.saveContext()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
