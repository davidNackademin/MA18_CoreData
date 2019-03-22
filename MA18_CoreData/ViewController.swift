//
//  ViewController.swift
//  MA18_CoreData
//
//  Created by David Svensson on 2019-03-22.
//  Copyright © 2019 David Svensson. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let itemEntityName = "ShoppingItem"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        storeShoppingItem(name: "majs", done: false)
        storeShoppingItem(name: "ärtor", done: false)
        
        
    }

    func storeShoppingItem(name: String, done: Bool) {
        let context = getContext()
        
        if let entity = NSEntityDescription.entity(forEntityName: itemEntityName, in: context) {
            
            let item = NSManagedObject(entity: entity, insertInto: context)
            
            item.setValue(name, forKey: "name")
            item.setValue(done, forKey: "done")
            
            
            do {
                try context.save()
                print("Saved!")
                
            } catch let error as NSError {
                print("Save error: \(error)")
            }
        }
    }
    
    
    
    
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

}

