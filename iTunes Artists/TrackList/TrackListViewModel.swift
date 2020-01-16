//
//  TrackListViewModel.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit

class TrackListViewModel: TrackListViewModelType {
    
    weak var delegate: TrackListViewModelDelegate?

    private let client = TrackClient()
    private var tracks = TracksSearch()
    internal var lastSearch = ""
    internal var page = 0
    internal var noMorePages = false
    internal var isSearching:Bool = false
    
    func getTrack(at index: Int) -> Track? {
        guard let trackArray = tracks.results else { return nil }
        return trackArray[index]
    }
    
    func getTrackSize() -> Int? {
        return tracks.results?.count
    }
    func searching() -> Bool {
        return isSearching
    }
    func search(searchText:String) {
        isSearching = true
        if searchText != lastSearch {
            self.lastSearch = searchText
            self.page = 0
            self.noMorePages = false
            self.tracks = TracksSearch()
        }
        if page == 0 {
            self.delegate?.showSkeleton()
        }
        client.getTracks(with: searchText, andPage: page) { [weak self] result in
              switch result {
              case .success(let trackResult):
                guard let tracks = trackResult else { return }
                if let tracksArray = tracks.results {
                    self?.delegate?.stopSkeleton()
                    if !tracksArray.isEmpty {
                        if self?.tracks.results == nil {
                            self?.tracks = tracks
                        } else {
                            self?.tracks.results?.append(contentsOf: tracksArray)
                        }
                        self?.isSearching = false
                        self?.page += 1
                        self?.delegate?.didLoadData()
                    } else {
                        self?.isSearching = false
                        if self?.page == 0 {
                            self?.delegate?.setBackgroundView(withText: "Could not find any entrys for: \(searchText)",
                            image: UIImage(named: "loupe"))
                        } else {
                            self?.noMorePages = true
                        }
                        
                    }
                }
              case .failure(let error):
                self?.delegate?.stopSkeleton()
                switch error {
                case .requestFailed:
                    self?.isSearching = false
                    self?.delegate?.setBackgroundView(withText: "Could not make the request, please check your internet access",
                    image: UIImage(named: "close"))
                    
                default:
                    self?.isSearching = false
                    self?.delegate?.setBackgroundView(withText: "Something Went Wrong With the Request",
                    image: UIImage(named: "close"))
                }
              }
          }
    }
    func reloadLastSearch() {
        search(searchText: lastSearch)
    }
    func getNextPage() {
        if !noMorePages {
            search(searchText: lastSearch)
        }
    }
}
