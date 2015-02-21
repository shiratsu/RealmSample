//
//  AddView.swift
//  RealmSample2
//
//  Created by HIRATSUKA SHUNSUKE on 2015/02/20.
//  Copyright (c) 2015年 HIRATSUKA SHUNSUKE. All rights reserved.
//

import UIKit

import Realm

class AddView: UIViewController {
    
    @IBOutlet weak var todo_content: UITextField!
    
    let realm = RLMRealm.defaultRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTodo(sender: AnyObject) {
        
        // Bookオブジェクト生成.
        let book = Book()
        book.isbn = Int(arc4random() % 100 + 1)
        book.name = todo_content.text
        book.price = 100
        
        // Bookオブジェクトを保存.
        realm.beginWriteTransaction()
        realm.addObject(book)
        realm.commitWriteTransaction()
        
        performSegueWithIdentifier("back",sender: nil)
    }
    
}
