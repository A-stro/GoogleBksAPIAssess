//
//  GoogleAPI.swift
//  GoogleBksAPIAssess
//
//  Created by Aaron Gerell on 8/18/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

struct GoogleAPI {
    
    //Book - https://www.googleapis.com/books/v1/volumes?q=captain+underpants
    
    static let base = "https://www.googleapis.com/books/v1/volumes?q="
    
    
    static func getURL(with search: String) -> String {
        return base + search
    }
    
    
}
