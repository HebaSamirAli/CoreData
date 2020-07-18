//
//  NewWordViewController.swift
//  Polyglot
//
//  Created by HebaMac on 7/1/20.
//  Copyright © 2020 HSAAA. All rights reserved.
//

import UIKit
import CoreData

class NewWordViewController: UIViewController {

    @IBOutlet weak var txtEnglishWord: UITextField!
    @IBOutlet weak var txtArabicWord: UITextField!
    
    var newWord: [NSManagedObject] = [NSManagedObject]() // for CoreData
    
    
    @IBAction func btnAddWordClicked(_ sender: UIButton) {
    
        CoreDataHelper().storeData(userName: "hossam", englishWord: txtEnglishWord.text!, arabicWord: txtArabicWord.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
