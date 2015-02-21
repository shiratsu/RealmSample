//
//  Book.swift
//  RealmSample2
//
//  Created by HIRATSUKA SHUNSUKE on 2015/02/20.
//  Copyright (c) 2015年 HIRATSUKA SHUNSUKE. All rights reserved.
//

import Foundation

import Realm

class Book : RLMObject {
    dynamic var isbn = 0
    dynamic var name = ""
    dynamic var price = 0
    
    // primaryKeyの指定.
    override class func primaryKey() -> String {
        return "isbn"
    }
    
    // isbnを指定して結果を返す.
    class func find(isbn:Int) -> Book? {
        let result = Book.objectsWithPredicate(NSPredicate(format: "isbn = %d", isbn))
        if let books = result {
            return books.firstObject() as? Book
        }
        return nil
    }
}