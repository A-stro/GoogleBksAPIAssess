//
//  BookTableCell.swift
//  GoogleBksAPIAssess
//
//  Created by Aaron Gerell on 8/18/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class BookTableCell: UITableViewCell {

    var book: Book! {
        didSet {
            bookTitle.text = book.volumeInfo.title
            bookAuthor.text = book.volumeInfo.authors?.joined(separator: ", ")
            
            guard let url = URL(string: book.volumeInfo.imageLinks.smallThumbnail) else {
                return
            }
            URLSession.shared.dataTask(with: url) { [weak self] (dat, _, err) in
                if let _ = err {
                    return
                }
                
                if let data = dat {
                    DispatchQueue.main.async {
                        self?.bookImage.image = UIImage(data: data)
                        print("Reloaded ListTableView")
                    }
                }
                
                }.resume()
        }
    }
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    

    
    static let identifier = "BookTableCell"
}
