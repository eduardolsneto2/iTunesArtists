//
//  TrackListViewController.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController {

    var trackListVM: TrackListViewModelType?
    var refreshControl = UIRefreshControl()

    @IBOutlet weak var trackListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.trackListVM = TrackListViewModel()
        trackListVM?.delegate = self
        settupSearch()
        settupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func settupCollectionView() {
        setBackgroundView(withText: "Type your favorite Artist's Name above and click \"Search\"", imageName: "music")
    }
    
    func settupSearch() {
        if #available(iOS 11.0, *) {
            let searchController = UISearchController(searchResultsController: nil)
            // Setup the Search Controller
//            searchController.searchResultsUpdater = self
            searchController.searchBar.delegate = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search by Artist's Name"
            searchController.searchBar.tintColor = .blue
            navigationItem.searchController = searchController
            definesPresentationContext = true
        }
        self.trackListCollectionView.alwaysBounceVertical = true
        
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        trackListCollectionView.addSubview(refreshControl)
    }
    
    @objc func reload() {
        self.trackListCollectionView.backgroundView?.isHidden = true
        trackListVM?.reloadLastSearch()
    }

}
