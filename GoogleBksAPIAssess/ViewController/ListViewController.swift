//
//  ViewController.swift
//  GoogleBksAPIAssess
//
//  Created by Aaron Gerell on 8/16/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var viewModel = ViewModel() {
        didSet {
            listTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFeature()
        
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private func setupFeature() {
        definesPresentationContext = true
        
        searchController.searchBar.delegate = (self as UISearchBarDelegate)
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        viewModel = ViewModel()
//        viewModel.get(with: "captain+underpants")
        
    }
    
    
    
    
    func setupList() {
        
        NotificationCenter.default.addObserver(forName: Notification.Name("VMNote"), object: nil, queue: .main) { note in
            
            let userInfo = note.userInfo!
            guard let vModel = userInfo["vm"] as? ViewModel else {
                return
            }
            
            self.viewModel = vModel
            DispatchQueue.main.async {
            self.listTableView.reloadData()
            print("Reloaded ListTableView")
            }
        }
    }


}

extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTableCell.identifier, for: indexPath) as! BookTableCell
        let book = viewModel.books[indexPath.row]
        cell.book = book
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bk = viewModel.books[indexPath.row]
        viewModel.currentBook = bk
        goToDetail(with: viewModel)
    }
    
    
}

extension ListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchQuery = searchBar.text,
            let search = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                return
        }
        
        viewModel.get(with: search)
        
        searchController.isActive = false
    }
}

