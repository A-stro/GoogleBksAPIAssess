//
//  GoogleService.swift
//  GoogleBksAPIAssess
//
//  Created by Aaron Gerell on 8/18/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

typealias BookHandler = ([Book]) -> Void

let service = GoogleService.shared

final class GoogleService {
    
    static let shared = GoogleService()
    private init() {}
    
    
    func getBooks(search: String, completion: @escaping BookHandler) {
        
        let urlString = GoogleAPI.getURL(with: search)
        
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            
            if let error = err {
                print(error.localizedDescription)
                completion([])
                return
            }
            
            if let data = dat {
                do {
                    let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
                    let books = bookResponse.items
                    completion(books)
                } catch {
                    print(error.localizedDescription)
                    completion([])
                    return
                }
            }
            }.resume()
    }
}
