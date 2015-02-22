//
//  ViewController.swift
//  RealmSample2
//
//  Created by HIRATSUKA SHUNSUKE on 2015/02/20.
//  Copyright (c) 2015年 HIRATSUKA SHUNSUKE. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var myItems:RLMResults!
    
    @IBOutlet weak var todoView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myItems = Book.allObjects()
        self.navigationItem.title = "Todoリスト"
    }
    
    override func viewWillAppear(animated: Bool) {
        todoView.reloadData()
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    
    /*
    Cellの総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(bitPattern:myItems.count)
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Cellの.を取得する.
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        // Cellに値を設定する.
        let book:Book = myItems.objectAtIndex(UInt(indexPath.row)) as! Book
        
        cell.textLabel!.text = book.name
        
        
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

