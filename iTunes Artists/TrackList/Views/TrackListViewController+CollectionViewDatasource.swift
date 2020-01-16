//
//  TrackListViewController+CollectionViewDatasource.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit

extension TrackListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 394, height: 301)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = trackListVM.getTrackSize() else { return 0 }
        self.trackListCollectionView.backgroundView?.isHidden = true
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.trackListCollectionView.dequeueReusableCell(withReuseIdentifier: "trackCell", for: indexPath) as? TrackCollectionViewCell {
            let track = trackListVM.getTrack(at: indexPath.row)!
            cell.settup(track: track)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}
