//
//  HomeScreenTableViewController.swift
//  Polyglot
//
//  Created by HebaMac on 7/1/20.
//  Copyright © 2020 HSAAA. All rights reserved.
//

import UIKit
import CoreData

class HomeScreenTableViewController: UITableViewController {

    var word: [NSManagedObject] = [NSManagedObject]() // from CoreData
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return word.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)

        // Configure the cell...
        let data = word[indexPath.row]
        cell.textLabel?.text = (data.value(forKey: "english") as! String)
        cell.detailTextLabel?.text = (data.value(forKey: "arabic") as! String)

        return cell
    }
    

    override func viewWillAppear(_ animated: Bool) {
        if let results = CoreDataHelper().getData(){
            word = results
        }
        
        tableView.reloadData()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            
         
            //tableView.reloadData()
        //} else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
   
}
