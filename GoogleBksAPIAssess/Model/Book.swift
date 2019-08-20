//
//  Book.swift
//  GoogleBksAPIAssess
//
//  Created by Aaron Gerell on 8/18/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

struct BookResponse: Decodable {
    let items: [Book]
}

class Book: Decodable {
    
    let volumeInfo: VolumeInfo

    }


struct VolumeInfo: Decodable {
    
    let title: String
    let authors: [String]?
    let bookDescription: String?
    let imageLinks: ImageLinks
    
}

struct ImageLinks: Decodable {
    
    let smallThumbnail: String
    let thumbnail: String
    
}
