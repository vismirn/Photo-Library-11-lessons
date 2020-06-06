//
//  MainTableView.swift
//  Photo Library
//
//  Created by Алексей Пархоменко on 06.06.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
    }
    
}

extension MainTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}
