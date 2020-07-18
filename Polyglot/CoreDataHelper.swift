//
//  CoreDataHelper.swift
//  Transcriber
//
//  Created by HebaMac on 3/14/20.
//  Copyright © 2020 HSAAA. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper
{
    init(){
        let container = NSPersistentContainer(name: "bcdadeya") // refer to (.xcdatamodeld file)
        container.loadPersistentStores{ StoreDescription, error in
            if let error = error {
                print("Heba, \(error)")
            } else {print("Heba, CoreData OK")}
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    // *********************** MARK store data to CoreData **************************
    
    func storeData (url: String){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "BookMarkImage", in: context)
        let myData = NSManagedObject(entity: entity!, insertInto: context)
        
        myData.setValue(url, forKey: "url")
        //print("my new data to stor\(url)")
        
        do{
            try context.save()
            print("Heba, Saved to CoreData")
            //print("number of records \(getData()?.count)")

        } catch {}
        
    }
    
    
    
    // ********************* MARKS get txt FILENAME from CoreData *********************
    
    func getData() -> [NSManagedObject]? {
        let fetchRequest: NSFetchRequest<BookMarkImage> = BookMarkImage.fetchRequest()
        
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            //print("Heba Number of results = \(searchResults.count)")
         
            return searchResults as [NSManagedObject]
        } catch {return nil}
    }
    
    func deleteData(){
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "BookMarkImage", in: context)
        let myData = NSManagedObject(context: context)
        context.delete(myData)
        //do{
            //try context.save()
            print("Heba, delete record from CoreData")
        //} catch {}

        
    }
    
}
