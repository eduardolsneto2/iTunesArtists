//
//  TrackListViewController+UISearchBarDelegate.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 09/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit

extension TrackListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            self.trackListVM?.search(searchText: searchText)
        }
    }
}
