//
//  TrackListViewController+UICollectionViewDelegate.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 09/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit

extension TrackListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let count = self.trackListVM?.getTrackSize() else { return }
        guard let searching = trackListVM?.searching() else { return }
        if indexPath.row == count - 3 {
            if (!searching) {
                trackListVM?.getNextPage()
            }
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let trackVM = trackListVM?.getWatchTrackViewModel(at: indexPath.row) else { return }
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let VM = trackVM
        if let VC = storyboard.instantiateViewController(identifier: "TrackVideoID") as? WatchTrackViewController {
            VC.watchTrackVM = VM
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}
