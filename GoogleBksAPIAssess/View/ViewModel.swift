//
//  ViewModel.swift
//  GoogleBksAPIAssess
//
//  Created by Aaron Gerell on 8/18/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func updateView()
}


class ViewModel {
    
    /* ViewModel
     1. Business Logic
     2. Service Calls
     3. Data
     */
    
    weak var delegate: ViewModelDelegate?
    
    var books = [Book]() {
        didSet {
            delegate?.updateView()
        }
        
    }
    
    
    var currentBook: Book!
    
    
    func get(with search: String) {
        
        service.getBooks(search: search) { bks in
            self.books = bks
            print("Book Count: \(bks.count)")
        }
 }

}
